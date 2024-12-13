export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/opt/homebrew/bin:$PATH"
export GPG_TTY=$(tty)

eval "$(starship init zsh)"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

# Aliases for custom commands
alias ls="eza -liah"
alias cat="bat"

# Aliases for custom locations

alias home="cd ~"
alias chatham="cd ~/Chatham/"

# Custom functions

mount_ndrive() {
  python3 ~/Chatham/Git/SysAdmins/jakub_repo/Automation/MacOS/mount_adc_fileserver.py mount
}
umount_ndrive() {
  python3 ~/Chatham/Git/SysAdmins/jakub_repo/Automation/MacOS/mount_adc_fileserver.py umount
}

NDrive() {
  cd /Users/jfuczek/Chatham/N_Drive/ADCFileServer/
}

