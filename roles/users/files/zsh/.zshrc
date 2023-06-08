########################
# Export PATH Variables#
########################

export PATH="$PATH:/usr/local/sbin:/usr/local/go/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.local/bin:~/bin:$HOME/go/bin"

# Add MacOS python path
export PATH="$PATH:$HOME/Library/Python/3.9/bin/"

# Add php packages
export PATH="$HOME/.config/composer/vendor/bin:$HOME/.symfony/bin:$PATH:$HOME/.composer/vendor/bin"

# Add node modules
export PATH="$HOME/bin/node_modules:$PATH"

# Add rofi scripts to path
export PATH="$HOME/.config/rofi/scripts/:$PATH"
# Setup kubernetes krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

########################
# Export Variables#
########################
export ZSH=~/.oh-my-zsh
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export EDITOR=/usr/bin/vim
export K9S_EDITOR=/usr/bin/vim
# java hack
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
########################
#     ZSH CONFIGS      #
########################
ZSH_CUSTOM=~/.config/zsh
plugins=(git common-aliases tmux history ansible fzf zsh-autosuggestions dnf)
# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
ZSH_DISABLE_COMPFIX=true
# UI settings
ZSH_THEME="spaceship"
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# set options commands
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

########################
# source files         #
########################
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -r ${TTY:-} && -w ${TTY:-} && $+commands[stty] == 1 ]] && stty -ixon <$TTY >$TTY
emulate sh -c "source /etc/profile"
source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/functions.zsh
# reload kubernetes context files
reload-kubectl-contexts
