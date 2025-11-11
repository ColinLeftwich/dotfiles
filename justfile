set dotenv-load

rebuild machine="$MACHINE": fmt
	sudo nixos-rebuild switch --flake ~/dotfiles#{{machine}}

test machine="$MACHINE": fmt
	sudo nixos-rebuild test --flake ~/dotfiles#{{machine}}

fmt:
	alejandra . &>/dev/null
