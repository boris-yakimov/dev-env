#!/bin/sh

choice=$(
  wofi --dmenu --fuzzy --insensitive <<'EOF'
Chrome
Terminal
Firefox
Dolphin
Steam
Heroic Games Launcher
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
  exec env GDK_SCALE=1 steam # GDK_SCALE to fix issue where steam is blurry due to the 1.5 scaling of the 4k monitor (it seems it cannot interpred fractional scaling so we need to use 1 for 100%, 2 for 200%, etc)
  ;;
Heroic\ Games\ Launcher)
  exec flatpak run com.heroicgameslauncher.hgl
  ;;
esac
