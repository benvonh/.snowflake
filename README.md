# .flake

Nix flake configurations for NixOS and Home Manager.

Features
---
- `Hyprland` - Wayland compositor
- `Neovim` - themed and plugged
- `ZSH` - with powerlevel10k
- `EWW` - for functional ricing

Contents
---
Systems (NixOS):
- `zeph` - laptop

Profiles (Home Manager):
- `ben` - desktop
- `dev` - minimal

Install
---
Prerequisites:
- `git`
- `nix`
- `home-manager`

1. Online install (NixOS) - NOT RECOMMENDED
```sh
# Create new system configuration on your own remote repository
sudo nixos-rebuild switch --flake github:benvonh/.flake#<system>
```

2. Online install (Home Manager) - RECOMMENDED
```sh
# Prefer `dev` for only terminal configuration
home-manager switch --flake github:benvonh/.flake#<profile>
```

3. Local install (NixOS)
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

4. Local install (Home Manager)
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
Aliases are created for installing the Nix flake. The hostname and username are automatically used.
```sh
# NixOS configuration
nrs # sudo nixos-rebuild switch --flake ~/.flake

# Home Manager configuration
hms # home-manager switch --flake ~/.flake
```

Thanks To...
---
- [Misterio77](https://github.com/misterio77) for his flake template at [nix-starter-configs](https://github.com/misterio77/nix-starter-configs)
