source "$ZSH_CUSTOM/functions/docker.zsh"
source "$ZSH_CUSTOM/functions/generic.zsh"
source "$ZSH_CUSTOM/functions/kubernetes.zsh"

function  djangoInit() {
 mkvirtualenv $1; workon $1; pip3 install django
}
