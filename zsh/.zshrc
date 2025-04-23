# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd
setopt autopushd
setopt extendedglob
setopt globdots
setopt nomatch
setopt notify
setopt incappendhistory
setopt histsavenodups
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorealldups
setopt histignorespace
setopt histfindnodups
setopt histsavenodups
setopt share_history
stty -ixon

##################
# KEYBINDINGS
##################
bindkey -v
bindkey -M vicmd '_' vi-first-non-blank
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^S' vi-cmd-mode
bindkey -M vicmd '^Y' redo

# To enter vim normal mode by default
# zle-line-init() { zle -K vicmd; }
# zle -N zle-line-init

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/main/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(completion)

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 2h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

##################
# ENV
##################
export PAGER='less -S'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export KEYTIMEOUT=1

##################
# ALIASES
##################

# GIT
alias gs="git status"
alias gl="git log"
alias glo="git log --oneline"
alias ga="git add"
alias gai="git add --interactive"
alias gap="git add --patch"
alias gc="git commit"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"
alias gds="git diff --staged"
alias gch="git checkout"
alias gb="git branch"
alias gf="git fetch"
alias gfp="git fetch --prune"
alias gr="git rebase"
alias gri="git rebase -i"
alias gst="git stash"
alias gm="git merge"
alias grs="git restore --staged"
alias gsm="git submodule"
alias gsw="git switch"
alias gswc="git switch --create"

# LS
alias l='ls --color=always -F'
alias la='ls --color=always -AF'
alias ll='ls --color=always -alFh'
alias llb='ls --color=always -alF'
alias llk='ls --color=always -alF --block-size=K'
alias llm='ls --color=always -alF --block-size=M'
alias llg='ls --color=always -alF --block-size=G'
alias labs='ls --color=always -AFd "$PWD/"*'
alias llabs='ls --color=always -alFhd "$PWD/"*'

# Clip
alias clip="xclip -selection clipboard"

alias nv="neovide --fork"
