alias cls="clear"
alias py="python3"
alias py2="python"
alias isimulator="open -a Simulator"
alias ll="colorls -l --sd"

pgsql() {
    if [ -n "$1" ]
    then
        pg_ctl -D /usr/local/var/postgres "$1"
    else
        echo "expected 1 arguments, start | stop | status"
    fi
}
