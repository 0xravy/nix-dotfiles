
{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./../../modules/shells/sh.nix
		# ./../../modules/editors/nixvim.nix
		# ./../../wm/wayland.nix
		./../../wm/x12.nix
		./../../hardware/audio.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos"; # Define your hostname.
	networking.networkmanager.enable = true;

	nixpkgs.config.allowUnfree = true;
	nix.package = pkgs.nix;
	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;
	};


	# Set your time zone.
	time.timeZone = "Asia/Riyadh";


	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "ar_EG.utf8";
		LC_IDENTIFICATION = "ar_EG.utf8";
		LC_MEASUREMENT = "ar_EG.utf8";
		LC_MONETARY = "ar_EG.utf8";
		LC_NAME = "ar_EG.utf8";
		LC_NUMERIC = "ar_EG.utf8";
		LC_PAPER = "ar_EG.utf8";
		LC_TELEPHONE = "ar_EG.utf8";
		LC_TIME = "ar_EG.utf8";
	};

	#console = {
	#	font = "Lat3-Terminus16";
	#	keyMap = "us";
	#	useXkbConfig = true; # use xkb.options in tty.
	#};


	services.openssh.enable = true;


	# Enable sound.
	hardware.pulseaudio.enable = false;
	sound.enable = true;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		wireplumber.enable = true;
		jack.enable = true;
	};

	# Enable CUPS to print documents.
	# services.printing.enable = true;


	users.defaultUserShell = pkgs.zsh;

	users.users.ravy = {
		shell = pkgs.zsh;
		initialPassword = "1235";
		description = "ravy man";
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
	};

	#home-manager.users.ravy = {
	#	home.packages = [
	#		  pkgs.neofetch
	#	];
	#};


	hardware.opengl.enable = true;

	#xdg.portal = {
	#	enable = true;
	#	extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	#};

	# environment.sessionVariavles = {
	#	WLR_NO_HARDWARE_CURSORS = "2";
	#	NIXOS_OZONE_WL = "2";
	# };

	fonts.packages = with pkgs; [ nerdfonts ];

	environment.variables = {
		SUDO_EDITOR = "nvim";
		SYSTEMD_EDITOR = "nvim";
		EDITOR = "nvim";
		VISUAL = "nvim";
	};

	environment.systemPackages = with pkgs; [
		# browsers
		firefox
		brave

		# myApps
		neofetch
		neovim
		lf
		eza
		wget
		kitty
		alacritty
		git
		mpd
		mpv
		fuzzel
		tofi
		btop
		nitrogen
		zip
		unzip
		home-manager
		vscodium

		#--- java for TLauncher
		openjdk8-bootstrap

		# --- rust
		rustup

		#--- bun
		bun
	];

	# ZRAM SWAP
	zramSwap = {
		enable = true;
		algorithm = "zstd";
		memoryPercent = 80;
	};

	system.stateVersion = "24.11";
}
