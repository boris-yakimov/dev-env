#!/bin/sh

choice=$(
  wofi --dmenu <<'EOF'
Chrome
Terminal
Firefox
Dolphin
EOF
)

case "$choice" in
Chrome)
  exec google-chrome-stable
  ;;
Terminal)
  exec kitty
  ;;
Firefox)
  exec firefox
  ;;
Dolphin)
  exec dolphin
  ;;
esac
