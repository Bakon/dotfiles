export ZSH="/Users/bakon/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="robbyrussell"

plugins=(git)

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/asdf/asdf.sh
