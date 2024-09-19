# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

source ~/.gitrc
source ~/.kuberc

# Datadog
export DD_API_KEY=
export DD_APP_KEY=
export DD_HOST=https://api.datadoghq.com/

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPROXY=direct

# Python
alias python="python3"
alias pip="pip3"

# K8s
RPROMPT='$(kube_ps1)'
export KUBECTX_CURRENT_FGCOLOR=$(tput setaf 6)
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
export KUBECTX_CURRENT_FGCOLOR=$(tput setaf 6)
export KUBE_EDITOR='code --wait'

# Vscode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Aws
# export AWS_ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
alias pub-log="aws ecr-public get-login-password --region us-east-1 | HELM_EXPERIMENTAL_OCI=1 helm registry login --username AWS --password-stdin public.ecr.aws"
alias priv-log="aws ecr get-login-password --region us-east-1 | HELM_EXPERIMENTAL_OCI=1 helm registry login --username AWS --password-stdin $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com"
alias asso="aws-sso-util"
export AWS_PAGER="bat"

# Docker
alias docker-kill="docker rm -f $(docker ps -a -q)"
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Misc
alias hg="history | grep"
alias lzd='lazydocker'

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH="/Users/jonahjones/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
gpg-agent
aws
kube-ps1
z
)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(atuin init zsh)"
alias cx="compass"
alias cw="compass workspace"
export IGNORE_PYTHON_VERSION_REQUIREMENT="1"  ##compass5ea843
export VIRTUALENVWRAPPER_VIRTUALENV="/opt/homebrew/bin/virtualenv"  ##compass5ea843
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/Library/Python/3.9/bin:$PATH"  ##compass5ea843


function short_cluster_name_from_eks() {
	# hide the prompt if no cluster is configured
	if [[ $1 == "N/A" ]]; then
		echo ""
		return 0
	fi

	# If it is not a cluster ARN, leave it alone
	if ! [[ $1 =~ ^arn:.*:cluster/ ]]; then
		printf "%s" "$1"
		return 0
	fi
	local full_name=$(printf "%s" "$1" | cut -d: -f5,6,7)
	# remove namespace prefix if present
	full_name=${full_name#${NAMESPACE}-}
	# remove eks and everything after it, if present
	full_name=${full_name%-eks-*}
	printf "%s" "${full_name}"
	# If NAMESPACE is unset, delete everything before and including the first dash
	# printf "%s" "$1" | sed -e 's%arn.*:cluster/'"${NAMESPACE:-[^-]\+}"'-\([^-]\+\)-eks-.*$%\1%'
}
[[ -z $KUBE_PS1_CLUSTER_FUNCTION ]] && KUBE_PS1_CLUSTER_FUNCTION=short_cluster_name_from_eks
