#!/usr/bin/env python3
import json, sys, time, subprocess, re
from datetime import datetime

def read_file(path, default=''):
    try:
        with open(path) as f:
            return f.read().strip()
    except Exception:
        return default

def run(cmd):
    try:
        return subprocess.check_output(cmd, text=True, stderr=subprocess.DEVNULL).strip()
    except Exception:
        return ''

def block(text, bg, fg='#1d2021'):
    return {'full_text': f' {text} ', 'background': bg, 'color': fg,
            'separator': False, 'separator_block_width': 0}

def get_volume():
    vol_out = run(['pactl', 'get-sink-volume', '@DEFAULT_SINK@'])
    mute_out = run(['pactl', 'get-sink-mute', '@DEFAULT_SINK@'])
    m = re.search(r'(\d+)%', vol_out)
    vol = m.group(1) + '%' if m else '?'
    icon = '󰝟' if 'yes' in mute_out else '󰕾'
    return f'{icon} {vol}'

def get_cpu(prev):
    with open('/proc/stat') as f:
        vals = list(map(int, f.readline().split()[1:]))
    total = sum(vals)
    idle = vals[3] + vals[4]
    dt = total - prev[0]
    di = idle - prev[1]
    pct = (dt - di) * 100 // dt if dt > 0 else 0
    return pct, (total, idle)

def get_memory():
    info = {}
    with open('/proc/meminfo') as f:
        for line in f:
            k, v = line.split(':', 1)
            info[k.strip()] = int(v.split()[0])
    used = info['MemTotal'] - info['MemAvailable']
    pct = used * 100 // info['MemTotal']
    used_gb = used / 1048576
    return f'{used_gb:.1f}G {pct}%'

def get_disk():
    out = run(['df', '/'])
    lines = out.strip().split('\n')
    return lines[1].split()[4] if len(lines) >= 2 else '?'

def get_wifi():
    ssid = run(['iwgetid', '-r'])
    return ssid if ssid else 'offline'

def get_battery():
    cap = read_file('/sys/class/power_supply/BAT0/capacity', '?')
    status = read_file('/sys/class/power_supply/BAT0/status', '')
    icon = {'Charging': '⚡', 'Full': '󰁹'}.get(status, '󰂎')
    try:
        level = int(cap)
        if level < 20:
            bg, fg = '#cc241d', '#fbf1c7'
        elif level < 50:
            bg, fg = '#d79921', '#1d2021'
        else:
            bg, fg = '#98971a', '#1d2021'
    except ValueError:
        bg, fg = '#928374', '#1d2021'
    return f'{icon} {cap}%', bg, fg

def get_brightness():
    b = read_file('/sys/class/backlight/amdgpu_bl1/brightness')
    mb = read_file('/sys/class/backlight/amdgpu_bl1/max_brightness')
    if b and mb:
        try:
            return f'󰃞 {int(b) * 100 // int(mb)}%'
        except ValueError:
            pass
    return None

sys.stdout.write('{"version":1}\n[\n')
sys.stdout.flush()

with open('/proc/stat') as f:
    vals = list(map(int, f.readline().split()[1:]))
cpu_prev = (sum(vals), vals[3] + vals[4])

first = True
while True:
    blocks = []

    blocks.append(block(get_volume(), '#d79921'))

    cpu_pct, cpu_prev = get_cpu(cpu_prev)
    blocks.append(block(f' {cpu_pct}%', '#98971a'))

    blocks.append(block(f' {get_memory()}', '#928374'))
    blocks.append(block(f' {get_disk()}', '#458588'))
    blocks.append(block(f'󰖩 {get_wifi()}', '#689d68'))

    bright = get_brightness()
    if bright:
        blocks.append(block(bright, '#d65d0e'))

    bat_text, bat_bg, bat_fg = get_battery()
    blocks.append(block(bat_text, bat_bg, bat_fg))

    dt = datetime.now().strftime('%Y-%m-%d %a %H:%M')
    blocks.append(block(dt, '#504945', '#ebdbb2'))

    prefix = '' if first else ','
    sys.stdout.write(prefix + json.dumps(blocks) + '\n')
    sys.stdout.flush()
    first = False
    time.sleep(1)
