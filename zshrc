# Lines configured by zsh-newuser-install
export PATH="${PATH}:$HOME/.local/bin"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/theodor/.zshrc'
#Prompt zsh
autoload -Uz promptinit
prompt fade
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
autoload -Uz compinit
compinit
zstyle ':completion:*' rehash true
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# aliases
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -h'                      # show sizes in MB
alias plog='cat /var/log/pacman.log'
alias plasma-logout='qdbus org.kde.ksmserver /KSMServer logout 0 0 1'
alias x=startx
alias b=btop
alias n=neofetch
alias mnt='udisksctl mount -b'
alias umnt='udisksctl unmount -b'
# End of lines added by compinstall
