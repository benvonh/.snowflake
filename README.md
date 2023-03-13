# Snow

A Nix flake configuration for NixOS and Home Manager. Appropriately named `snow` for its Nordic theme.

Structure
---
```
snow
├── assets
├── config
├── desktop
│  ├── hyprland
│  ├── service
│  ├── share
│  ├── shell
│  └── theme
├── modules
│  ├── home
│  └── nixos
├── overlays
├── pkgs
├── systems
│  ├── base
│  └── zeph
└── users
   ├── ben
   └── dev
```

Common Usage
---
Install config...
```sh
# 
sudo nixos-rebuild switch --flake /path/to/snow

# 
```

## Thanks To...

- [Misterio77](https://github.com/misterio77) for his NixOS and Home Manager [template](https://github.com/misterio77/nix-starter-configs)
- [mitchellh](https://github.com/mitchellh) for inspiration from his [nixos-config](https://github.com/mitchellh/nixos-config)
- [linuxmobile](https://github.com/linuxmobile) for showing his [Hyprland config](https://github.com/mitchellh/nixos-config) on [ChrisTitusTech](https://youtube.com/@ChrisTitusTech)'s Hyprland stream