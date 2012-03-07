# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):
fill="--- "

reset_style='\[\033[00m\]'
if [ -z "$VIM" ];
then status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
else status_style=$reset_style'\[\033[0;90;107m\]'
fi
prompt_style=$reset_style
command_style=$reset_style'\[\033[1;29m\]' # bold black
# Prompt variable:

OLD_PS1="$PS1"
PS1="$status_style"'$fill \t\n'"$prompt_style$OLD_PS1$command_style"

# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\e[0m"' DEBUG


function prompt_command {

    # create a $fill of all screen width minus the time string and a space:
    let fillsize=${COLUMNS}-9
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="-${fill}" # fill with underscores to work on 
        let fillsize=${fillsize}-1
    done

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        bname=`basename "${PWD/$HOME/~}"`
        echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
        ;;
    *)
        ;;
    esac
  
}
PROMPT_COMMAND=prompt_command
