#!/usr/bin/env bash

print_usage() {
    echo "Usage: $0 /path/to/snow/flake [ os | hm ] [ build | test | switch | update | clean | edit ]"
}

if [[ ! -f "$1/flake.nix" ]];
then
    echo "No flake found in $1"
    exit 2
fi

echo "Flake: $1"

case "$1" in
    'os' )
        cmd='sudo nixos-rebuild'
        ;;
    'hm' )
        cmd='home-manager'
        ;;
    * )
        print_usage
        exit 1
        ;;
esac

echo "Command: $cmd"
      
case "$2" in
    'build' )
        $cmd build --flake "$1"
        ;;
    'test' )
        $cmd test --flake "$1"
        ;;
    'switch' )
        $cmd switch --flake "$1"
        ;;
    'update' )
        cd $1
        nix flake update
        cd -
        ;;
    'clean' )
        sudo nix-collect-garbage
        ;;
    'edit' )
        $EDITOR $path
        ;;
    * )
        print_usage
        exit 2
        ;;
esac
