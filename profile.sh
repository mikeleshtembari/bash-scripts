# will create a timer with alarm at the end, need 1 arg, time in seconds
function timerr() {
    : ${1?"Usage: $0 <Time in seconds>"}
    again=''
    # timer
    for ((x = $(expr $1); x >= 0; --x)); do
        echo -en "\r$x        "
        sleep 1
    done
    echo 'Timer done!'
    # alarm
    for x in {1..20..1}; do
        play -n synth 0.2 sin 440 &> /dev/null
    done
    echo "Restart same timer again? [y/...]"
    read -n 1 again
    if [[ $again == 'y' ]]
    then
        timerr $1
    else
        echo -e "\n"
        return
    fi
}
