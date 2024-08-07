#!/bin/bash
# Script para la instalacion de arch linux con gestor de ventanas awesome
# e inicio de sesion con LightDM

# Conectandose a internet con wifi
#nmcli device wifi connect "Net05" password "A&B&Dios"

# Actualizando sistema
sudo pacman -Syu

# Instalar gestor de ventanas y de inicio de sesion
sudo pacman -S awesome
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm

# Configurando gestor de ventanas
mkdir -p ~/.config/awesome
cp /etc/xdg/awesome/rc.lua ~/.config/awesome/					# Copiando configuracion por defecto
cp /usr/share/awesome/themes/default/theme.lua ~/.config/awesome/		# Copiando tema por defecto
sed -i 's/terminal = "xterm"/terminal = "kitty"/g' ~/.config/awesome/rc.lua	# Cambiando terminal por defecto
sed -i 's/nano/nvim/g' ~/.config/awesome/rc.lua
sed -i "s#beautiful\.init(gears\.filesystem\.get_themes_dir() \.\. \"default/theme\.lua\")#beautiful.init(\"$HOME/.config/awesome/theme.lua\")#g" ~/.config/awesome/rc.lua	# Cambiando ubicacion de tema por defecto

# Instalando audio
sudo pacman -S --noconfirm alsa-utils pulseaudio pulseaudio-alsa pavucontrol
sudo usermod -aG audio hawk

# Instalando algunos paquetes necesarios
sudo pacman -S --noconfirm kitty neofetch zip unzip tar p7zip wget

# COnfiguranto kitty
mkdir -p ~/.config/kitty
echo "font_size 11" >> ~/.config/kitty/kitty.conf

# Instalando gestor de aquetes paru
#
#git clone https://aur.archlinux.org/paru.git
#cd paru
#makepkg -si
#rm -rf paru/
#paru -S google-chrome

# Instalacion de terminal zsh
sudo pacman -S zsh

# Agregando la terminal zsh al usuario hawk
sudo usermod --shell /usr/bin/zsh hawk

# Plugins para mejorar zsh
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions # Agregando plugins a zsh

# Instalar locate pra saber ubicacion de los archivos en el sistema
#sudo pacman -S locate
#sudo updatedb # Actualizar base de datos de locate
#sudo mkdir -p /usr/share/zsh-sudo # Agregando carpeta de configuracion para zsh-sudo
#sudo chown hawk:hawk /usr/share/zsh-sudo # Cambiando permisos a la carpeta 
#cd /usr/share/zsh-sudo
#wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh # Descargando plugin

# Instalar lsd y bat para mejorar la experiencia de de los comandos ls y cat
sudo pacman -S lsd bat

# Instalacion de powerlevel10k. tema para la terminal zsh
cd ~/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
#'https://github.com/romkatv/powerlevel10k#manual'
# Instalar extencion de vimium para google-chrome

# Instalar fzf para buscar rapidamente archivos. Presionar Ctrl + T para abrir. Ejemplo "cat Ctrl + T".
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#~/.fzf/install



# Agregando tema dracula
sudo git clone https://github.com/dracula/gtk.git /usr/share/themes/Dracula

# Instalar adminsitrador de archivos
sudo pacman -S thunar
