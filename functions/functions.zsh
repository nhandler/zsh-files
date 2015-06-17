#  Functions

function webserver () {
    if [ "$1" != "" ]; then
        python2 -m SimpleHTTPServer $1
    else
        python2 -m SimpleHTTPServer 5001
    fi
}

function myip() {
    # Print public IP to stdout
    wget -qO- http://ipecho.net/plain && echo
}

function zsh-time() {
    # Time ZSH startup
    time zsh -i -c exit
}


function incognito() {
    # Run a command or multiple commands without saving it in the $HISTFILE
    if [ -z $EDITOR ]; then
        EDITOR=vim
    fi

    # Create temp for storing commands
    TEMPFILE=`mktemp -q incognito.XXXXXXXX`

    # Prompt for commands, only run if successful
    $EDITOR $TEMPFILE || {
        echo "Invalid return on the editing"
        return
    }

    # Run the script
    sh $TEMPFILE

    # Clean everything up
    rm -f $TEMPFILE
}

function di () {
    #   Docker inspect helper
    # argv[1] is inspect path | [--net | -n] | [--vol | -v]
    # argv[2] is container name
    #
    if [[ $1 = '' ]] || [[ $2 = '' ]]
    then
        echo "Missing an argument"
    elif [[ $1 = '--net' ]] || [[ $1 = '-n' ]]
    then
        docker inspect -f "{{ json .NetworkSettings }}" $2 | python -mjson.tool      
    elif [[ $1 = '--vol' ]] || [[ $1 = '-v' ]]
    then
        docker inspect -f "{{ json .Volumes }}" $2 | python -mjson.tool      
    else
        docker inspect -f "{{ json $1 }}" $2 | python -mjson.tool      
    fi
}

function da () {
    #  Docker Attach
    # argv[1] == container name
    docker start $1 && docker attach $1
}

function newbox () {
    #  Runs docker container as argv[1] and mounts volume container
    docker run --name $1 \
               --volumes-from=volume_container -it \
               coxley/env
}

rtr () {
    # Terminal server
    re='^[0-9]+$'
    m="10.1.39.80"
    b="10.1.0.167"
    ch="10.1.56.40"
    if [[ "$1" = "-b" ]]
    then
        telnet "$b" $(($2+2000))
    elif [[ "$1" = "-c" ]]
    then
        telnet "$ch" $(($2+2064))
    elif [[ "$1" = "-m" ]]
    then
        telnet "$m" $(($2+2000))
    elif [[ "$1" =~ $re ]]
    then
        telnet "$b" $(($1+2000))
    else
        echo "Not supported"
    fi
}

function extract() {
    # Idea stolen and modified slightly as most versions of tar can just be
    # passed 'xvf' without specifying encryption
    if [ -f $1 ] ; then
        case $1 in
            *.tar*)
                tar xvf $1;;
            *.tbz2)
                tar xvf $1;;
            *.tgz)
                tar xvf $1;;
            *.bz2)
                bunzip2 $1;;
            *.gz)
                gunzip $1;;
            *.rar)
                unrar x $1;;
            *.zip)
                unzip $1;;
            *.Z)
                uncompress $1;;
            *.7z)
                7z x $1;;
            *)
                echo "'$1' cannot be extracted via >extract<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function taocl() {
    # Art of the Command Line
    curl -s \
        https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md |
        pandoc -f markdown -t html |
        xmlstarlet fo --html --dropdtd |
        xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
        xmlstarlet unesc | fmt -80
}
