# This is my .bash_profile script
# Evidently, you need to have extra packages installed in order for everything to work




# show this file
alias mycmd="ccat ~/.bash_profile | more"

#export JAVA_HOME=$(/usr/libexec/java_home)
#export PATH=$JAVA_HOME/jre/bin:$PATH

# redirect to clipboard (middle mouse button MOUSE3)
# use like this:
# copy > echo "aaa" | xclip
# paste> xclip -o
alias clip='echo -e "Redirect to clipboard (middle mouse button MOUSE3)\nUse like this:\ncopy:\n\techo "aaa" | xclip\npaste:\n\txclip -o"'

#ls sorted by time modified, newest last
alias lss='echo -e "> ls -acltr\n" && ls -acltr'
alias lls='echo -e "> ls -acltr\n" && ls -acltr'

alias ll='echo -e "> ls -l\n" && ls -l'
alias la='echo -e "> ls -la\n" && ls -la'
alias l='echo -e "> ls\n" && ls'

#for xampp
alias xamppp='echo -e "> cd /opt/lampp/ && sudo ./manager-linux-x64.run &\n" && cd /opt/lampp/ && sudo ./manager-linux-x64.run'

#for changing screen res
alias screenres='echo "xrandr -s 1366x768" && xrandr -s 1366x768'

#colorized cat, with python
alias ccat="pygmentize -g -O style=colorful,linenos=1"

#sync folders - use "rsync -rtv dir1 dir2"

#convert midi to wav using timidity
alias miditowav='echo -e "convert midi to wav using timidity\nuse command:\n\ttimidity in.mid -Ow -o out.wav"'

#delete all files recursively
alias delall='echo -e "delete all files recursively\nBe carefull when using this!\n\tfind . -type f -name \"*.txt\" -delete"'

#like snipping tool from windows
alias snipp='echo -e "> import \"Pictures/Snips/Snip $(date +%F\ %T).png\"" && import "Pictures/Snips/Snip $(date +%F\ %T).png"'

# pygmentize -O style=monokai -f html -O full -o out.html .bash_profile
alias texttohtml='echo -e "Converts a source file in colored html.\nUse command:\n\tpygmentize -f html -O full -o out.html in.py\n\nRemove [O -full if you want just a html snippet\n"'
alias htmlconvert="texttohtml"



# will create a timer with alarm at the end, need 1 arg, time in seconds
# call it from terminal like $> timerr 100
function timerr() {
    : ${1?"Usage: timerr <Time in seconds>"}
    again=""
    anim="";
    val=$1


    echo -e "\nPress a digit between 1 and 9 to add that amount of minutes to the timer.\nPress 'q' to quit timer.\n\nTimer started. \e[92m$(date '+%Y-%m-%d %H:%M:%S')\e[39m"

    # timer
    for ((x = $val; x >= 0; --x))
    do
        echo -en "\r$x        "

        read -t 0.1 -n 1 key && echo -en "\b "

        if [[ $key = q ]]
        then
            echo "Timer interrupted"
            return
        fi
        if [[ $key > 0 && $key < 10 ]]
        then
            val=$val+60*$key
            x=$x+60*key
        fi

        sleep 0.9
    done

    echo -e "\nTimer done! \e[92m$(date '+%Y-%m-%d %H:%M:%S')\e[39m \nPress anything to stop.\n"
    
    # alarm
    cnt=0
    anim=""
    color=""
    freq=0

    for (( ;; ))
    do
        play -n synth 0.1 sin $freq &> /dev/null
        echo -en "\r$color$anim                 *** Timer done! ***    "
        cnt=$(( $cnt + 1 ))

        if [[ $freq == 440 ]]
        then
            freq=330
            color="\e[91m"
        else
            freq=440
            color="\e[39m"
        fi

        # little animation
        if [[ $(($cnt % 8)) == 1 || $(($cnt % 8)) == 7 ]]
        then
            anim=" "
        elif [[ $(($cnt % 8)) == 2 || $(($cnt % 8)) == 6 ]]
        then
            anim="  "
        elif [[ $(($cnt % 8)) == 3 || $(($cnt % 8)) == 5 ]]
        then
            anim="   "
        elif [[ $(($cnt % 8)) == 4 ]]
        then
            anim="    "
        else
            anim=""
        fi

        read -t 0.01 -n 1 key && echo -en "\r"

        if [[ $key ]]
        then
            break
        fi
    done
    echo -e "\e[39m\n\nRestart same timer again? [y/...]"
    read -n 1 again
    if [[ $again == 'y' ]]
    then
        timerr $1
    else
        echo -e "\n"
        return
    fi
}
