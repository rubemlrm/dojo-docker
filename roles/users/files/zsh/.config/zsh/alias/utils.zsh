#directories
alias works="cd ~/Works"
alias codedir="cd ~/Works/Code"
alias dotfiles="cd ~/Works/Code/Personal/dotfiles"
alias buildfiles="cd ~/Works/Code/Personal/buildfiles"
alias personalSite="cd ~/Works/Code/Personal/rubemlrm.github.io"
alias professionalCode="cd ~/Works/Code/Professional"
alias personalCode="cd ~/Works/Code/Personal"
alias sandbox="cd ~/Works/Code/Sandbox"

#system utils
alias h='history'
alias g="git"
alias reload="source ~/.zshrc"
alias sf="screenfetch"
alias psa="ps aux"
alias psg="ps aux | grep "
alias ducks='du -cks * | sort -rn | head' #get biggest directories
alias distro='cat /etc/*-release'

# vimrc editing
alias ve='vim ~/.vimrc'
# zsh profile editing
alias ze='vim ~/.zshrc'
alias syncDotFiles="dotfiles && git pull && bash bootstrap.sh"
alias vim='nvim'
alias vi='nvim'

#apps
alias irssi='TERM=screen-256color irssi'
alias checkBranchesToRemove='git branch -r | awk "{print $1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print $1}"'
alias removeMergedBranches='git branch -r | awk "{print $1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print $1}" | xargs git branch -d'

#docker
alias updateDockerImages='docker images --format "{{.Repository}}:{{.Tag}}" | grep ":latest" | xargs -L1 docker pull'

#encodes
alias t64='toBase64 $1'
alias f64='fromBase64 $1'

#tmux
alias tdev='tmux new-session "tmux source-file ~/.tmux/development"'
alias update="sudo dnf update -y && flatpak update -y && pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U && npm upgrade && composer global update"
