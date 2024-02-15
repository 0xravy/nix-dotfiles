{ pkgs, ...}:

let myAliases = {
	ls="exa --icons";
	lt="exa --icons --tree";
	la="exa -a -l --icons";
	lg="exa -a -l --icons --git";
	v="nvim";
	sv="sudo nvim";
	nix-reb="sudo nixos-rebuild switch --flake /etc/nixos/#default";
}; in

{
       #programs.bash = {
       #	enable = true;
       #	shellAliases = myAliases;
       #};
	
	programs.zsh = {
		enable = true;
		shellAliases = myAliases;
		#dotDir = ".config/zsh";
		enableCompletion = true;
		histSize = 10000;


		#oh-my-zsh = {
		#	enable = true;
		#	theme = "robbyrussell";
		#};

		#zplug = {
		#	enable = true;
		#	plugins = [
		#		{ name = "zsh-users/zsh-autosuggestions"; } 
		#		{ name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
		#	];
		#};
	};
}
