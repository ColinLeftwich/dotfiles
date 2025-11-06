rebuild: fmt
	sudo nixos-rebuild switch --flake ~/dotfiles

fmt:
	alejandra . &>/dev/null
