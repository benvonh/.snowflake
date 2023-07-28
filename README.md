# snow
Nix flake configurations for NixOS and Home Manager.

Features
---
- `Hyprland` - Wayland compositor
- `Neovim` - terminal IDE
- `Zsh` - with powerlevel10k
- `Eww` - fancy widgets

Configurations
---
Systems (NixOS):
- `zeph` - laptop

Profiles (Home Manager):
- `ben` - desktop
- `dev` - minimal

Online Install
---
1. If Nix and Home Manager is installed and flakes are enabled, you can install a profile directly from GitHub.
```sh
home-manager switch --flake github:benvonh/.snow#<profile>
```

Local Install
---
1. Clone and enter the Nix environment.
```sh
git clone https://github.com/benvonh/.snow ~/.snow
cd ~/.snow
nix-shell
```

2. If you would like, create new NixOS and Home Manager configurations. Otherwise, skip to next step.
```sh
cp -rv ~/.snow/systems/zeph ~/.snow/systems/$HOSTNAME
cp -rv ~/.snow/profiles/ben ~/.snow/systems/$USER
nixos-generate-config --show-hardware-config > ~/.snow/systems/$HOSTNAME/hardware.nix
```

3. Read and edit the flake. Main files of interest are:
- `flake.nix`
- `systems/$HOSTNAME/default.nix`
- `systems/$HOSTNAME/share/**`
- `profiles/$USER/default.nix`
- `profiles/$USER/share/**`

3. Switch to your NixOS and Home Manager configurations.
```sh
sudo nixos-rebuild switch --flake ~/.snow
home-manager switch --flake ~/.snow
```

Thanks To...
---
- [Misterio77](https://github.com/misterio77) for creating flake templates at [nix-starter-configs](https://github.com/misterio77/nix-starter-configs)
