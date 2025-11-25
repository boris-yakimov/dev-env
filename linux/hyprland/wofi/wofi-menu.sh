#!/bin/sh

choice=$(
  wofi --dmenu --fuzzy --insensitive <<'EOF'
Chrome
Terminal
Firefox
Dolphin
Steam
Heroic Games Launcher
Localsend
Discord
Ghostty
Kitty
Zoom
RocketChat
Slack
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
Localsend)
  exec flatpak run org.localsend.localsend_app
  ;;
Discord)
  exec flatpak run com.discordapp.Discord
  ;;
Ghostty)
  exec ghostty
  ;;
Kitty)
  exec kitty
  ;;
Zoom)
  exec zoom
  ;;
RocketChat)
  exec rocketchat-desktop
  ;;
Slack)
  exec slack-desktop
  ;;
esac
