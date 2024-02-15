{ config, lib, pkgs, ... }:

{
	imports = [
		./hyprland/hyprland.nix
	];

	 environment.systemPackages = with pkgs; [
		webcord
	];
}
