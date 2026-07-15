sudo rm -rf /var/lib/pacman/sync/*
sudo pacman -Syy
sudo pacman-key --refresh-keys
sudo pacman -S archlinux-keyring
