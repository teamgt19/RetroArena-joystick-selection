#!/usr/bin/env bash
##############
# ATTENTION! #
##############
# This file has changed (26-March-2017). Now it works as RetroArena scriptmodule.
# Name this file as ~/RetroArena-Setup/scriptmodules/suplementary/joystick-selection.sh
# and then execute the retropie_setup.sh script.
# To install the joystick-selection tool, go to
# Manage packages >> Manage experimental packages >> joystick-selection >> Install from source

rp_module_id="joystick-selection"
rp_module_desc="Set controllers for RetroArch players 1-4 (global or system specific)."
rp_module_help="Follow the instructions on the dialogs to configure which joystick to use for RetroArch players 1-4 (global or system specific)."
rp_module_section="exp"

function depends_joystick-selection() {
    getDepends "libsdl2-dev"
}

function sources_joystick-selection() {
    gitPullOrClone "$md_build" "https://github.com/teamgt19/RetroArena-joystick-selection.git"
}

function build_joystick-selection() {
    gcc "$md_build/jslist.c" -o "$md_build/jslist" $(sdl2-config --cflags --libs)
}

function install_joystick-selection() {
    local gamelistxml="$datadir/settingsmenu/gamelist.xml"
    local rpmenu_js_sh="$datadir/settingsmenu/joystick_selection.sh"

    ln -sfv "$md_inst/joystick_selection.sh" "$rpmenu_js_sh"
    # maybe the user is using a partition that doesn't support symbolic links...
    [[ -L "$rpmenu_js_sh" ]] || cp -v "$md_inst/joystick_selection.sh" "$rpmenu_js_sh"

    cp -v "$md_build/icon.png" "$datadir/settingsmenu/icons/joystick_selection.png"

    cp -nv "$configdir/all/emulationstation/gamelists/retroarena/gamelist.xml" "$gamelistxml"
    if grep -vq "<path>./joystick_selection.sh</path>" "$gamelistxml"; then
        xmlstarlet ed -L -P -s "/gameList" -t elem -n "gameTMP" \
            -s "//gameTMP" -t elem -n path -v "./joystick_selection.sh" \
            -s "//gameTMP" -t elem -n name -v "SYSTEM: JOYSTICK SELECTION" \
            -s "//gameTMP" -t elem -n desc -v "Select which joystick to use for RetroArch players 1-4 (global or system specific)." \
            -s "//gameTMP" -t elem -n image -v "./icons/joystick_selection.png" \
            -r "//gameTMP" -v "game" \
            "$gamelistxml"

        # XXX: I don't know why the -P (preserve original formatting) isn't working,
        #      The new xml element for joystick_selection tool are all in only one line.
        #      Then let's format gamelist.xml.
        local tmpxml=$(mktemp)
        xmlstarlet fo -t "$gamelistxml" > "$tmpxml"
        cat "$tmpxml" > "$gamelistxml"
        rm -f "$tmpxml"
    fi

    # needed for proper permissions for gamelist.xml and icons/joystick_selection.png
    chown -R $user:$user "$datadir/settingsmenu"

    md_ret_files=(
        'jslist'
        'jsfuncs.sh'
        'joystick_selection.sh'
    )
}

function remove_joystick-selection() {
    rm -rfv "$configdir"/*/joystick-selection.cfg "$datadir/settingsmenu/icons/joystick_selection.png" "$datadir/settingsmenu/joystick_selection.sh"
    xmlstarlet ed -P -L -d "/gameList/game[contains(path,'joystick_selection.sh')]" "$datadir/settingsmenu/gamelist.xml"
}

function gui_joystick-selection() {
    bash "$md_inst/joystick_selection.sh"
}
