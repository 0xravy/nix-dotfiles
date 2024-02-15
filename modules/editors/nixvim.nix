{ pkgs, lib, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
    # ref = "nixos-23.05";
  });
in
{
  imports = [
    # For NixOS
    nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;
    plugins.lightline.enable = true;
  };
}
