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
