# Snow
A Nix flake configuration for NixOS and Home Manager. Appropriately named `snow` for its Nordic theme.

## Install
---
This guide will assume:
- NixOS is installed and booted into; or
- Nix is installed on another Linux distro.  

### NixOS
---
1. Clone repository
```sh
git clone https://github.com/benvonh/snow ~/snow
cd ~/snow
```

2. Bootstrap nix shell
```sh
# v2.4+
nix develop
# legacy
nix-shell
```

3. Add hardware config
```sh
nixos-generate-config --show-hardware-config > ~/snow/hardware/$HOST.nix

```

4. 
```SH
# Build NixOS
sudo nixos-rebuild switch --flake .#zeph
home-manager switch --flake .#ben
```

## Special Thanks To...
---
Misterio77 for providing a [nix flake template](https://github.com/misterio77/nix-starter-configs) to the community. I was able to set this up in a few days thanks to his work.
