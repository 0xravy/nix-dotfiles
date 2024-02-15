{ config, lib, pkgs, ... }:


{

	environment.systemPackages = with pkgs; [
		waybar
		eww
		swww
		dunst
		wlr-randr
		wtype
		wl-clipboard
		hyprland
		hyprland-protocols
		hyprpicker
		hyprpaper
		swayidle
		gtklock
		swaybg
		xwayland
		xdg-desktop-portal-hyprland
		wlsunset
		pavucontrol
		pamixer
		grim
		slurp
		rofi-wayland
		wofi
		bemenu
		libnotify
		wpaperd
		mpvpaper
	];

}
