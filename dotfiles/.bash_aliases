alias cls="clear"
alias py="python3"
alias py2="python"
alias iosemulator="open -a Simulator"
alias ll="colorls -l --sd --time-style='+%d-%m-%y'"
alias nvi="nvim"
alias nvimt="nvim +NERDTree"
alias nvit="nvim +NERDTree"
alias nvimtree="nvim +NERDTree"
alias yt-dl="youtube-dl"
alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'
alias pjm="bat ~/.projectman"
alias androidemu="emulator -avd Pixel4 -netspeed full -netdelay none &"
alias batcat="bat"

pgsql() {
    if [ -n "$1" ]
    then
        pg_ctl -D /usr/local/var/postgres "$1"
    else
        echo "expected 1 arguments, start | stop | status"
    fi
}
