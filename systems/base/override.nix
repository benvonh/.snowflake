# nixos.org/guides/nix-pills/override-design-pattern.html
rec {
  mkOverridable = f: origArgs:
    let
      origRes = f origArgs;
    in
      origRes // {
        override = newArgs: mkOverridable f (origArgs // newArgs);
      };
}