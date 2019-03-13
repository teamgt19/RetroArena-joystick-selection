#!/bin/bash
# installing RetroArena-joystick-selection tool

user="$SUDO_USER"
[[ -z "$user" ]] && user="$(id -un)"
home="$(eval echo ~$user)"
readonly RP_SETUP_DIR="$home/RetroArena-Setup"
readonly JS_SCRIPTMODULE_FULL="$RP_SETUP_DIR/scriptmodules/supplementary/joystick-selection.sh"
readonly JS_SCRIPTMODULE_URL="https://raw.githubusercontent.com/teamgt19/RetroArena-joystick-selection/master/js-scriptmodule.sh"
readonly JS_SCRIPTMODULE="$(basename "${JS_SCRIPTMODULE_FULL%.*}")"

if [[ ! -d "$RP_SETUP_DIR" ]]; then
    echo "ERROR: \"$RP_SETUP_DIR\" directory not found!" >&2
    echo "Looks like you don't have RetroArena-Setup scripts installed in the usual place. Aborting..." >&2
    exit 1
fi

curl "$JS_SCRIPTMODULE_URL" -o "$JS_SCRIPTMODULE_FULL"

if [[ ! -s "$JS_SCRIPTMODULE_FULL" ]]; then
    echo "Failed to install. Aborting..." >&2
    exit 1
fi

sudo "$RP_SETUP_DIR/retropie_packages.sh" "$JS_SCRIPTMODULE"
sudo "$RP_SETUP_DIR/retropie_packages.sh" "$JS_SCRIPTMODULE" gui
