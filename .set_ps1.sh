#=== Insert anything else here that should go in your .bashrc file ===#

#=== Configure Bash Prompt ===#

# Color bash prompt that displays the last 40 characters of the current
# working directory.
# From https://wiki.archlinux.org/index.php/Color_Bash_Prompt

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
fancy_pwd() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=40
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}
current_git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
set_ps1() {
    local CEND="\[\033[0m\]"    # unsets color to term's fg color

    # Color Codes
    local GREEN="\[\033[38;5;046m\]"    # green
    local YELLOW="\[\033[38;5;226m\]"    # yellow
    local BLUE="\[\033[38;05;45m\]"    # blue
    local GRAY="\[\033[38;05;250m\]" # gray
    local PURPLE="\[\033[38;05;099m\]" # purple
    local RED="\[\033[38;05;197m\]" # light red

    # PS1 Formatting
    local TIME="$GRAY\d \t$CEND "
    local USER="$BLUE\u$GRAY"
    local HOST="$BLUE\h$CEND"
    local LOCATION="$RED[\${NEW_PWD}]$CEND "
    local BRANCH="$YELLOW\$(current_git_branch)$CEND"
    local PROMPT="$GRAY\n\$$CEND "

    # Set PS1
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
      PS1=$TIME$USER@$HOST$LOCATION$BRANCH$PROMPT
    else
      PS1="$TIME$USER in $LOCATION$BRANCH$PROMPT"
    fi

    PS2='\[\033[01;36m\]>'
}
# Run fancy_pwd on every command to re-evaluate current dir
PROMPT_COMMAND=fancy_pwd
# Set PS1 and unset the function so it can't be used again
set_ps1
unset set_ps1
