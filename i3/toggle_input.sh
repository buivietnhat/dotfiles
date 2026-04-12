#!/bin/bash
current=$(ibus engine)
if [ "$current" = "xkb:us::eng" ]; then
    ibus engine Unikey
else
    ibus engine xkb:us::eng
fi
