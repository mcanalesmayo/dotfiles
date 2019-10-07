#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.4.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
export PATH=$PATH:/usr/local/opt/python/libexec/bin:/Users/marcos.canales/tools/apache-maven/bin:/Users/marcos.canales/tools/gradle/bin

export HISTTIMEFORMAT='%F %T '

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

alias ll='ls -lh'
alias lla='ls -lah'
alias llaf='ls -laph | grep -v /'

function git() {
  if [[ $1 == "log" ]]; then
    command git log --pretty=format:"%C(magenta)%h %Cgreen%ad %C(yellow)%p%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short "${@:2}"
  elif [[ $1 == "branch" ]]; then
    command git branch -vv "${@:2}"
  elif [[ $1 == "status" ]]; then
    git log -1 --format="%C(magenta)%h %Cgreen%ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short 2>&1
    command git status --short "${@:2}"
  elif [[ $1 == "last-diff" ]]; then
    LAST_COMMIT=$(git rev-parse HEAD)
    command git diff $LAST_COMMIT~ $LAST_COMMIT
  else
    command git "$@"
  fi
}

# Overload if not present
function tree() {
  find "$1" -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

function docker() {
  if [[ $1 == "ip-of" ]]; then
    command docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "${@:2}"
  else
    command docker "$@"
  fi
}

# Custom func to switch current Java environment to another version
function switch-java-v-to() {
    if [[ $1 == "8" ]]; then
        export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home
    elif [[ $1 == "11" ]]; then
        export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
    else
        echo "Unrecognized version. Available versions: [ 8, 11 ]"
        return
    fi

    NEW_JAVA_VERSION=$(java -version 2>&1)
    echo -e "Changed to the following version:\n\033[0;32m$NEW_JAVA_VERSION\033[0m"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

