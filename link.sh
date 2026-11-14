#!/bin/bash

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p ~/.config

# Helper Functions
print_warning() {
  echo -e "\033[30;43m Warning \033[0m: $1"
}

confirm() {
  read -n 1 -p "$1" selection
  echo ""

  if [[ "$selection" == "y" || "$selection" == "Y" ]]; then
    return 0
  else
    return 1
  fi
}

# Link Ghostty
if ! ln -s "$repo_dir/ghostty" ~/.config 2>/dev/null; then
  print_warning "~/.config/ghostty already exists."
  if confirm "Overwrite? (y/n) "; then
    rm -rf ~/.config/ghostty
    ln -s "$repo_dir/ghostty" ~/.config
  fi
fi

# Link Tmux
if ! ln -s "$repo_dir/tmux" ~/.config 2>/dev/null; then
  print_warning "~/.config/tmux already exists."
  if confirm "Overwrite? (y/n) "; then
    rm -rf ~/.config/tmux
    ln -s "$repo_dir/tmux" ~/.config
  fi
fi

# Link Nvim
if ! ln -s "$repo_dir/nvim" ~/.config 2>/dev/null; then
  print_warning "~/.config/nvim already exists."
  if confirm "Overwrite? (y/n) "; then
    rm -rf ~/.config/nvim
    ln -s "$repo_dir/nvim" ~/.config
  fi
fi

# Link Bash Files
if ! ln -s "$repo_dir/bash/bash_aliases" ~/.bash_aliases 2>/dev/null; then
  print_warning "~/.bash_aliases already exists."
  if confirm "Overwrite? (y/n) "; then
    rm ~/.bash_aliases
    ln -s "$repo_dir/bash/bash_aliases" ~/.bash_aliases
  fi
fi
