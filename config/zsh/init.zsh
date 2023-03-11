# Flex...I mean flakes
neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt redhat

# Use modern completion system
autoload -U zmv

# Powerlevel10k
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# Extra
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Prompt
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Autocomplete
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' min-delay 0.2
source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Flake config helper functions
flake() {
    local path=$(fd snow $HOME)

    if (($(echo "$path" | wc -l) != 1)); then
        echo 'More than one directory named `snow` found'
    fi

    case "$1" in
        'build' )
            sudo nixos-rebuild build --flake "$path.#$2"
            ;;
        'test' )
            sudo nixos-rebuild test --flake "$path.#$2"
            ;;
        'switch' )
            sudo nixos-rebuild switch --flake "$path.#$2"
            ;;
        'update' )
            cd $path
            if [[ $# -eq 1 ]]; then
                nix flake update
            else
                nix flake lock --update-input $2
            fi
            cd -
            ;;
        'clean' )
            sudo nix-collect-garbage
            ;;
        'edit' )
            if [[ $# -eq 1 ]]; then
                $EDITOR $path
            else
                $EDITOR $path/config/$2
            fi
            ;;
        * )
            echo "Invalid command: $1"
            ;;
    esac
}
