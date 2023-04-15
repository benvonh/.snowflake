# Snow

A Nix flake configuration for NixOS and Home Manager. Named `snow` for its Nordic theme.

Contents
---
*Systems (NixOS)*
- Laptop: `zeph`

*Profiles (Home Manager)*
- Main: `ben`
- Minimal: `dev`

Install
---
```sh
git clone --recursive https://github.com/benvonh/snow ~/snow
cd ~/snow
nix develop
# or if experimental features are not enabled...
nix develop --experimental-features 'nix-commands flakes'
```

Usage
---
```sh
snow-home
# aliased to `home-manager switch --flake ~/snow`
snow-nixos
# aliased to 'sudo nixos-rebuild switch --flake ~/snow'

# NOTE: Defaults to using $USER and $HOST
```

## Thanks To...

- [Misterio77](https://github.com/misterio77) for his NixOS and Home Manager [template](https://github.com/misterio77/nix-starter-configs)
- [mitchellh](https://github.com/mitchellh) for inspiration from his [nixos-config](https://github.com/mitchellh/nixos-config)
- [linuxmobile](https://github.com/linuxmobile) for his [Hyprland config](https://github.com/mitchellh/nixos-config)
