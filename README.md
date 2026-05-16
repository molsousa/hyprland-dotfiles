## Meus dotfiles para Hyprland no Archlinux

Mistura de outros dotfiles com personalizações.


### [Waybar](https://github.com/cybrcore/cybr-waybar)

![Waybar](./images/2026-05-16-105408-211_hyprshot.png)


### [Wofi](https://github.com/7KIR7/dots/tree/main/wofi)

![Wofi](./images/2026-05-16-105720-653_hyprshot.png)


### Terminal

![Terminal](./images/2026-05-16-110058-178_hyprshot.png)



### [Hyprlock](https://github.com/MrVivekRajan/Hyprlock-Styles/tree/main/Style-9)

![Hyprlock](./images/20260516_11h40m38s_grim.png)

### Instalar AUR

```sh
sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si
```

### Instalar pacotes

- **Hyprpaper:** gerenciador de papel de parede.

- **Hyprlock:** gerenciador de tela de bloqueio.

- **Wofi:** lançador de aplicativos.

- **Thunar:** gerenciador de arquivos.

- **Waybar:** barra de tarefas.

```sh
sudo pacman -S hyprpaper hyprlock wofi thunar waybar
```

### Caso não tenha o terminal

- **Kitty:** Emulador de terminal acelerado por GPU.

```sh
sudo pacman -S kitty
```

### Caso não tenha o zsh

Interpretador de comandos.

```sh
sudo pacman -S zsh
```
