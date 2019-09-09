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
    command git log --pretty=format:"%C(magenta)%h %Cgreen%ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short "${@:2}"
  elif [[ $1 == "branch" ]]; then
    command git branch -vv "${@:2}"
  elif [[ $1 == "status" ]]; then
    command git status --short -b "${@:2}"
  elif [[ $1 == "commit-push-all" ]]; then
    # Prevent using master and develop branches for normal commits
    BRANCH=$(git symbolic-ref --short HEAD)
    echo "$BRANCH"
    if [[ "$BRANCH" == "master" ]] || [[ "$BRANCH" == "develop" ]] || [[ "$BRANCH" == release/* ]]
    then
      echo "You are on branch $BRANCH, which should only be updated via pull request"
      return
    fi
    git add -A
    git commit -m "$2"
    git push
  elif [[ $1 == "last-diff" ]]; then
    LAST_COMMIT=$(git rev-parse HEAD)
    git diff $LAST_COMMIT~ $LAST_COMMIT
  else
    command git "$@"
  fi
}

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

