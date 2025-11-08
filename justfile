rebuild: fmt
	sudo nixos-rebuild switch --flake ~/dotfiles#hydrogen

fmt:
	alejandra . &>/dev/null

test:
	sudo nixos-rebuild switch --flake ~/dotfiles#hydrogen
