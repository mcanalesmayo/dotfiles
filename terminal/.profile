export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home
export PATH=$PATH:/Users/canalmar/Tools/apache-ant-1.10.4/bin:/Users/canalmar/Tools/apache-maven-3.5.4/bin:/Users/canalmar/Tools/gradle-4.8.1/bin

# Setting PATH for Python 3.7
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

alias ll='ls -l'
alias lla='ls -la'
alias llaf='ls -lap | grep -v /'

function git() {
	if [[ $@ == "log" ]]; then
		command git log --pretty=format:"%C(magenta)%h %Cgreen%ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short
	elif [[ $@ == "branch" ]]; then
		command git branch -vv
	elif [[ $@ == "status" ]]; then
		command git status --short -b
	else
		command git "$@"
	fi
}

function tree() {
	find "$1" -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

function commit-push-all() {
	# Prevent using master and develop branches for normal commits
	BRANCH=$(git symbolic-ref --short HEAD)
	echo "$BRANCH"
	if [[ "$BRANCH" == "master" ]] || [[ "$BRANCH" == "develop" ]] || [[ "$BRANCH" == release/* ]]
	then
		echo "You are on branch $BRANCH, which should only be updated via pull request"
		return
	fi
	git add -A
	git commit -m "$1"
	git push
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
