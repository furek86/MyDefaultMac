export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc

eval "$(starship init zsh)"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000


alias ls="eza -liah"
alias cat="bat"
