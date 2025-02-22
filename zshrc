
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh


export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt6ct


export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch $(uname -m)"

eval "$(zoxide init zsh)"

alias cd='z'
alias cat='bat'

alias n='nvim .'
alias emerge='cd dev && tmux new session -s dev'

#ghostty gpu
#alias ghostty='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia ghostty'

#flex
play() {
    if [[ -z "$1" ]]; then
        echo "Usage: play <filename>"
        return 1
    fi

    mpv --vo=gpu --gpu-api=vulkan --gpu-context=waylandvk \
        --hwdec=nvdec --no-config --fullscreen=no \
        --geometry=90%x90% "$1"
}

play_kitty() {
     if [[ -z "$1" ]]; then
        echo "Usage: play <filename>"
        return 1
    fi

mpv --vo=kitty --gpu-api=vulkan --gpu-context=waylandvk --hwdec=nvdec \
    --no-config --fullscreen=no --geometry=100%x100% "$1"
}

#zed
alias zed='zeditor'

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# bun completions
[ -s "/home/simple/.bun/_bun" ] && source "/home/simple/.bun/_bun"

fzf-file-widget() {
  local selected_file absolute_path
  
  # Use fd if available for better performance and respecting .gitignore
  if command -v fd > /dev/null; then
    selected_file=$(fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude build --exclude dist | fzf --height 40% --reverse --preview 'bat --color=always --style=numbers --line-range=:500 {}')
  else
    # Fallback to find if fd is not available
    selected_file=$(find . -type f \
      -not -path '*/\.*' \
      -not -path './node_modules/*' \
      -not -path './Arch-Hyprland/*' \
      -not -path './dev/web*/node_modules/*' \
      -not -path './build/*' \
      -not -path './dist/*' \
      -not -path './go/*' \
      -not -path './Android/*' \
      -not -path './Pictures/*' \
      -not -path './Videos/*' \
      -not -path './dev/c_c++/.exe' \
      -not -name '*.out' -not -name '*.exe' -not -name '*.bin' -not -name '*.obj' -not -name '*.o' | \
      fzf --height 40% --reverse --preview 'bat --color=always --style=numbers --line-range=:500 {}')
  fi
  
  # If a file was selected
  if [ -n "$selected_file" ]; then
    # Convert the selected file path to an absolute path
    if [[ "$selected_file" == /* ]]; then
      # If the path is already absolute, use it directly
      absolute_path="$selected_file"
    else
      # If the path is relative, prepend the current directory
      absolute_path="$(pwd)/$selected_file"
    fi

    # Debugging: Print the resolved path

    # Open the file in neovim
    nvim "$absolute_path"
  fi
  
  # Redisplay the command line
  zle reset-prompt
}

# Create the widget from the function
zle -N fzf-file-widget

# Bind space-ff to the widget
bindkey ' ff' fzf-file-widget

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

#cargo

export PATH="$HOME/.cargo/bin:$PATH"


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:/home/simple/.local/bin"export PATH=$HOME/.spicetify:$PATH
