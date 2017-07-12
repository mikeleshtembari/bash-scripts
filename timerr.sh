# will create a timer with alarm at the end, need 1 arg, time in seconds

# after timer has started, you can quit it (hit 'q'), pause it (hit 'p'), or add minutes (by hitting any digit between 1 and 9)

# you can include this function in your bash profile and
# call it from terminal like $> timerr 100

function timerr() {
    : ${1?"Usage: timerr <Time in seconds>"}
    again=""
    anim="";
    val=$1


    echo -e "\nPress a digit between 1 and 9 to add that amount of minutes to the timer.\nPress 'p' to pause.\nPress 'q' to quit timer.\n\nTimer started. \e[92m$(date '+%Y-%m-%d %H:%M:%S')\e[39m"

    # timer
    for ((x = $val; x >= 0; --x))
    do
        echo -en "\r$x        "

        read -t 0.1 -n 1 key && echo -en "\b "


        if [[ $key = p ]]
        then
            echo -e "Timer paused. Press anything to continue it."
            read -n 1
            echo -e "\n"

        fi

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
