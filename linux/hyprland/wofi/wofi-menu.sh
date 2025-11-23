#!/bin/sh

choice=$(
  wofi --dmenu <<'EOF'
Chrome
Terminal
Firefox
Dolphin
Steam
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
Steam)
  exec steam
  ;;
esac
