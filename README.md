# .snow

Nix flake configurations for NixOS and Home Manager.

Features
---
- `Hyprland` - Wayland compositor
- `Neovim` - terminal IDE
- `ZSH` - modern shell
- `EWW` - desktop ricing

Configurations
---
Systems (NixOS):
- `zeph` - laptop

Profiles (Home Manager):
- `ben` - desktop
- `dev` - minimal
- `ros` - TODO

Install
---
1. Online install (Home Manager) - RECOMMENDED
```sh
# Prefer `dev` for only terminal configuration
home-manager switch --flake github:benvonh/.flake#<profile>
```

2. Local install (NixOS)
```sh
git clone https://github.com/benvonh/.flake.git ~/.flake/
cd ~/.flake/
nix develop --experimental-features 'nix-commands flakes'

# Create new system configuration
cd ~/.flake/systems/
cp -rv zeph/ <name>
# Generate hardware configuraiton
nixos-generate-config --show-hardware-config > ~/.flake/systems/<name>/hardware.nix
# Edit share nix files and configuration
vim ~/.flake/systems/share/
# See usage
```

3. Local install (Home Manager)
```sh
git clone https://github.com/benvonh/.flake.git ~/.flake/
cd ~/.flake/
nix develop --experimental-features 'nix-commands flakes'

# Create new profile configuration
cd ~/.flake/profiles/
cp -rv ben/ <name>
# Edit share nix files and configuration
vim ~/.flake/profiles/share/
# See usage
```

Usage
---
Aliases are created for installing the Nix flake. The host name and user name are automatically used.
```sh
# NixOS configuration
nrs # sudo nixos-rebuild switch --flake ~/.flake

# Home Manager configuration
hms # home-manager switch --flake ~/.flake
```

Thanks To...
---
- [Misterio77](https://github.com/misterio77) for his flake template at [nix-starter-configs](https://github.com/misterio77/nix-starter-configs)
