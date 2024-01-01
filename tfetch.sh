OD=$(lsb_release -ds)
host="$(hostname)"
os="BASED ON""$(lsb_release -ds)"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
pkgmgr="$(basename "$(command -v apt 2> /dev/null)")"
packages="$(dpkg -l | wc -l)"
shell="$(basename "${SHELL}")"
ram="$(free -m | awk '/^Mem:/ {print $3 "MB/" $2 "MB"}')"

## UI DETECTION
parse_rcs() {
    for f in "${@}"; do
        wm="$(tail -n 1 "${f}" 2> /dev/null | cut -d ' ' -f 2)"
        [ -n "${wm}" ] && echo "${wm}" && return
    done
}

rcwm="$(parse_rcs "${HOME}/.xinitrc" "${HOME}/.xsession")"

ui='unknown'
uitype='UI'
if [ -n "${DE}" ]; then
    ui="${DE}"
    uitype='DE'
elif [ -n "${WM}" ]; then
    ui="${WM}"
    uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
    ui="${XDG_CURRENT_DESKTOP}"
    uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
    ui="${DESKTOP_SESSION}"
    uitype='DE'
elif [ -n "${rcwm}" ]; then
    ui="${rcwm}"
    uitype='WM'
elif [ -n "${XDG_SESSION_TYPE}" ]; then
    ui="${XDG_SESSION_TYPE}"
fi

ui="$(basename "${ui}")"

## DEFINE COLORS

# Terminal colors
bold="$(tput bold 2> /dev/null)"
black="$(tput setaf 0 2> /dev/null)"
red="$(tput setaf 1 2> /dev/null)"
green="$(tput setaf 2 2> /dev/null)"
yellow="$(tput setaf 3 2> /dev/null)"
blue="$(tput setaf 4 2> /dev/null)"
magenta="$(tput setaf 5 2> /dev/null)"
cyan="$(tput setaf 6 2> /dev/null)"
white="$(tput setaf 7 2> /dev/null)"
reset="$(tput sgr0 2> /dev/null)"

# Color variables
cl0="${cyan}"
cl1="${red}" 
cl2="${green}"
cl3="${yellow}"
cl4="${blue}"
cl5="${magenta}"
cl6="${cyan}"
cl7="${white}"
cl9="${reset}"

# Icons
icon_user="${cl0} "
icon_os="${cl1} "
icon_kernel="${cl2} "
icon_uptime="${cl3} "
icon_packages="${cl4} "
icon_shell="${cl5} "
icon_ui="${cl6} "
icon_pkgmgr="${cl7} "
icon_ram="${cl9} "

## ASCII ART
cat <<EOF
${c0}               ┌───────────${icon_user}${icon_os}${icon_kernel}${icon_uptime}${icon_packages}${icon_shell}${icon_ui}${icon_pkgmgr}${cl9}──────────┐
${c0}               ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}       ---(_)  ${lc}${icon_os} OS:        ${ic}${OD}${reset}
${c0}   _/  ---  \\  ${lc}${icon_kernel} KERNEL:    ${ic}${kernel}${reset} 
${c0}  (_) |   |    ${lc}${icon_uptime} UPTIME:    ${ic}${uptime}${reset}
${c0}    \\  --- _/  ${lc}${icon_packages} PACKAGES:  ${ic}${packages}${reset} 
${c0}       ---(_)  ${lc}${icon_shell} SHELL:     ${ic}${shell}${reset}
${c0}               ${lc}${icon_ui} ${uitype}:        ${ic}${ui}${reset}
${c0}               ${lc}${icon_pkgmgr} PACKAGE MANAGER: ${ic}${pkgmgr}${reset}
${c0}               ${lc}${icon_ram} RAM: ${ram}${reset}
${c0}               └──────────${cl0} ${cl1} ${cl2} ${cl3} ${cl4} ${cl5} ${cl6} ${cl7} ${cl9}───────────┘
EOF