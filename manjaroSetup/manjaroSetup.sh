clear
echo '##############################'
echo '#                            #'
echo "#   Janis's Manjaro Setup    #"
echo '#                            #'
echo '##############################'

echo 'Select actions by entering y'

echo 'Run preScript? (update, git-, ssh-setup)'
read do_preScript

sudo ufw enable
echo ''
echo 'Uncomplicated Firewall activated'

echo ''
echo 'What shall be done?'

echo ''
echo 'Create Dotfiles and symlinks?'
read do_symlinks

echo ''
echo 'Create folder for screenshots?'
read do_screenshot_folder

echo ''
echo 'Download base16-shell?'
read base_16

echo ''
echo 'Create temp folder?'
read temp_folder

echo ''
echo 'Download favourite Nerd Fonts?'
read nerdfonts

echo ''
echo 'Build vim?'
read do_vim

echo ''
echo 'Install yay?'
read do_yay

echo ''
echo 'Install Software?'
read do_software

# echo ''
# echo 'Install nitroshare?'
# read do_nitroshare

echo ''
echo 'Get LaTeX?'
read do_latex

echo ''
echo 'Install nodejs, npm, ruby etc.?'
read do_dev_software

echo 'Get Vimium for Chromium and Firefox?'
read do_vimium

echo 'All clear!'

if [[ $do_preScript == y* ]]; then
  source ~/dotfiles/manjaroSetup/preScript.sh
fi

if [[ $do_symlinks == y* ]]; then
  if [ ! -d ~/dotfiles ]; then
		mkdir ~/dotfiles
		mkdir ~/defaultBackups
		git clone git@github.com:janis-schanbacher/dotfiles.git ~/dotfiles
  else
    git remote set-url origin git@github.com:janis-schanbacher/dotfiles.git
  fi

  echo 'Creating symlinks:'

  mv ~/.bashrc ~/defaultBackups/.bashrc
  ln -s ~/dotfiles/bash/.bashrc ~
  source ~/.bashrc
  echo '.bashrc done'
  mv ~/.bash_profile ~/defaultBackups/.bash_profile
  ln -s ~/dotfiles/bash/.bash_profile ~
  # ln -s ~/dotfiles/bash/.bash_aliases ~
  # echo '.bash_aliases done'
  # ln -s ~/dotfiles/bash/.bash_machine ~
  # echo '.bash_machine done'

  ln -s ~/dotfiles/bash/.git-completion.bash ~
  echo '.git-completion.bash done'

  ln -s ~/dotfiles/kitty/kitty.conf ~/.config/kitty/
  echo '.kitty done'

  ln -s ~/dotfiles/vim/.vimrc ~
  echo '.vimrc done'

  #ln -s ~/Dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json
  #echo 'coc-settings.json done'

  #ln -s ~/Dotfiles/alsa/.asoundrc ~
  #echo '.asoundrc done'

  #mv ~/.Xresources ~/defaultBackups
  #ln -s ~/Dotfiles/Xresources/.Xresources ~
  #echo '.Xresources done'

  #mkdir ~/.config/polybar
  #ln -s ~/Dotfiles/polybar/config ~/.config/polybar
  #echo 'polybar config done'

  mv ~/.i3/config ~/defaultBackups/config_i3
  ln -s ~/dotfiles/i3config/i3.config ~/.i3/config
  echo 'i3 config done'

  # mv ~/.config/ranger/rc.conf ~/defaultBackups/rc.conf
  # ln -s ~/Dotfiles/ranger/rc.conf
  # echo 'ranger config done'

  ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
  echo 'git config done'

  mv ~/.profile ~/defaultBackups/.profile
  ln -s ~/dotfiles/profile/.profile ~/.profile
  echo 'profile done'

  sudo ln -s ~/dotfiles/i3config/create_i3_config.sh /usr/local/bin/create_i3_config
  echo 'create_i3_config done'
  sudo chmod a+x /usr/local/bin/create_i3_config
  echo 'chmod a+x has been applied'
fi

if [ ! -d ~/Pictures/Screenshots ]; then
	if [[ $do_screenshot_folder == y* ]]; then
		mkdir ~/Pictures/Screenshots
	fi
fi

if [[ $base_16 == y* ]]; then
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

if [ ! -d ~/temp ]; then
	if [[ $temp_folder == y* ]]; then
		mkdir ~/temp
	fi
fi

if [[ $nerdfonts == y* ]]; then
	mkdir ~/Downloads/fonts
	wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf -P ~/Downloads/fonts
	sudo cp ~/Download/fonts/*.ttf /usr/share/fonts/TTF/
	sudo cp ~/Download/fonts/*.otf /usr/share/fonts/OTF/
	fc-cache
fi

if [ ~/temp ]; then
	if [[ $do_vim == y* ]]; then
		sudo pacman -R vim
		cd ~/temp/
		git clone --depth 1 https://github.com/vim/vim.git
		echo "--------------------"
		echo "Python path example:"
		echo "/usr/lib/python3.8/config-3.8-x86_64-linux-gnu"
		echo "Latest python path?"
		read pyth_path
		echo "Latest vim version? (Example: 82)"
		read vim_version
		cd vim
		./configure --with-features=huge \
			      --enable-multibyte \
			      --enable-rubyinterp=yes \
			      --enable-pythoninterp=yes \
			      --enable-python3interp=yes \
			      --with-python3-config-dir=$pyth_path \
			      --enable-perlinterp=yes \
			      --enable-luainterp=yes \
			      --enable-gui=gtk2 --enable-cscope --prefix=/usr
		make VIMRUNTIMEDIR=/usr/share/vim/vim$vim_version
		sudo make install
		sudo pacman -S --noconfirm vim-plug
    vim +PlugInstall +qall
    cd ~
	fi

	if [[ $do_yay == y* ]]; then
		# cd ~/temp
		# git clone https://aur.archlinux.org/yay.git
		# cd yay
		# makepkg -si
		# cd ~
		sudo pacman -S --noconfirm yay
	fi

	# if [[ $do_nitroshare == y* ]]; then
		# cd ~/temp
		# wget https://aur.archlinux.org/cgit/aur.git/snapshot/nitroshare.tar.gz
		# tar xf nitroshare.tar.gz
		# cd nitroshare
		# makepkg -sri
		# cd ~
	# fi
fi

if [[ $do_software == y* ]]; then
  sudo pacman -S --noconfirm keychain
  sudo pacman -S --noconfirm ranger
  # sudo pacman -S --noconfirm rofi
  # sudo pacman -S --noconfirm manjaro-settings-manager
  sudo pacman -S --noconfirm kitty
  # sudo pacman -S --noconfirm pulseaudio
  # sudo pacman -S --noconfirm neofetch
  # sudo pacman -S --noconfirm feh
  # sudo pacman -S --noconfirm scrot
  # sudo pacman -S --noconfirm flameshot
  # sudo pacman -S --noconfirm cowsay
  # sudo pacman -S --noconfirm fortune-mod
  sudo pacman -S --noconfirm xclip
  # sudo pacman -S --noconfirm clementine
  # sudo pacman -S --noconfirm gthumb
  sudo pacman -S --noconfirm filezilla
  # sudo pacman -S --noconfirm tmux
  sudo pacman -S --noconfirm fzf
  sudo pacman -S --noconfirm diff-so-fancy
  sudo pacman -S --noconfirm the_silver_searcher
  sudo pacman -S --noconfirm telegram-desktop
  sudo pacman -S --noconfirm unzip
  sudo pacman -S --noconfirm zip
  sudo pacman -S --noconfirm unrar
  sudo pacman -S --noconfirm timeshift
  sudo pacman -S --noconfirm thunderbird
  sudo pacman -S --noconfirm tk #fixes gitk
  # sudo pacman -S --noconfirm polybar
  # sudo pacman -S --noconfirm udevil
  # sudo pacman -S --noconfirm playerctl
  # sudo pacman -S --noconfirm unclutter
  # sudo pacman -R --noconfirm palemoon-bin
  # sudo pacman -S --noconfirm youtube-dl
  # sudo pacman -S --noconfirm ntp && sudo timedatectl set-ntp true
  sudo pacman -S --noconfirm ncdu
  sudo pacman -S --noconfirm firefox
  sudo pacman -S --noconfirm chromium
  sudo pacman -S --noconfirm albert
  sudo pacman -S --noconfirm gimp
  sudo pacman -S --noconfirm inkscape
  sudo pacman -S --noconfirm viewnior # image viewer
  sudo pacman -S --noconfirm pdfmod
  sudo pacman -S --noconfirm rhythmbox
  sudo pacman -R --noconfirm hexchat
  sudo pacman -R --noconfirm pidgin

  # yay -S --noconfirm xcursor-dmz
  # yay -S --noconfirm google-chrome
  yay -S --noconfirm spotify
  # yay -S --noconfirm light-git
  # yay -S --noconfirm slack-desktop
  yay -S --noconfirm gucharmap
  yay -S --noconfirm xmeasure

  # sudo pacman -S --noconfirm kdeconnect
  # sudo ufw allow 1714:1764/udp
  # sudo ufw allow 1714:1764/tcp
  # sudo ufw reload
fi

# if [[ $do_latex == y* ]]; then
  # sudo pacman -S --noconfirm texlive-most texlive-lang
# fi

if [[ $do_dev_software == y* ]]; then
  sudo pacman -S --noconfirm nodejs
  sudo pacman -S --noconfirm npm
  sudo npm i -g n
  sudo npm i -g eslint
  sudo npm i -g stylelint
  yay -S --noconfirm ctags
  sudo pacman -S --noconfirm ruby
  sudo pacman -S --noconfirm lua51
fi

if [[ $do_vimium == y* ]]; then
  firefox https://addons.mozilla.org/de/firefox/addon/vimium-ff/
  chromium https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb/related
fi

echo ''
echo 'All done.'
