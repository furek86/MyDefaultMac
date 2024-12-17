export ZSH="$HOME/.oh-my-zsh"

ssh-add ~/.ssh/id_github 2> /dev/null

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/opt/homebrew/bin:$PATH"
export GPG_TTY=$(tty)

eval "$(starship init zsh)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
export FZF_DEFAULT_OPTS=" \
--color=spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# -- Use fd instead of fzf --


export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"


# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/.fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----

export BAT_THEME=tokyonight_night

# ---- Eza (better ls) -----


# Aliases for custom commands
alias cat="bat"
alias ls="eza --icons=always --color=always --long"

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

backup_my_configs() {
  cp ~/.zshrc ~/Personal_Store/GitHub/MyDefaultMac/dotfiles/.zshrc
  cp ~/.tmux.conf ~/Personal_Store/GitHub/MyDefaultMac/dotfiles/.tmux.conf
  cp ~/.config/starship.toml ~/Personal_Store/GitHub/MyDefaultMac/dotfiles/starship.toml
  cp ~/.config/kitty/kitty.conf ~/Personal_Store/GitHub/MyDefaultMac/dotfiles/kitty/kitty.conf

  cd ~/Personal_Store/GitHub/MyDefaultMac/ && git add --all && git commit -m "backup increment" && git push

}

