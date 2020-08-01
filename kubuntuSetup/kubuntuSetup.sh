clear
echo '##############################'
echo '#                            #'
echo "#   Janis's Kubuntu Setup    #"
echo '#                            #'
echo '##############################'

echo 'Select actions by entering y'

echo 'Run preScript? (update, git-, ssh-setup)'
read do_preScript

sudo ufw enable
sudo apt install --assume-yes gufw
echo ''
echo 'Uncomplicated Firewall activated, GUI installed'

echo ''
echo 'What shall be done?'

echo ''
echo 'Create Dotfiles and symlinks?'
read do_symlinks

echo ''
echo 'Create folder for screenshots?'
read do_screenshot_folder

# echo ''
# echo 'Download base16-shell?'
# read base_16

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
  source ~/dotfiles/kubuntuSetup/preScript.sh
fi

if [[ $do_symlinks == y* ]]; then
  if [ ! -d ~/dotfiles ]; then
		mkdir ~/dotfiles
		mkdir ~/.defaultBackups
		git clone git@github.com:janis-schanbacher/dotfiles.git ~/dotfiles
  else
    git remote set-url origin git@github.com:janis-schanbacher/dotfiles.git
  fi

  echo 'Creating symlinks:'

  mv ~/.bashrc ~/.defaultBackups/.bashrc
  ln -s ~/dotfiles/bash/.bashrc ~
  source ~/.bashrc
  echo '.bashrc done'
  mv ~/.bash_profile ~/.defaultBackups/.bash_profile
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

  # mv ~/.config/ranger/rc.conf ~/.defaultBackups/rc.conf
  # ln -s ~/Dotfiles/ranger/rc.conf
  # echo 'ranger config done'

  ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
  echo 'git config done'

  mv ~/.profile ~/.defaultBackups/.profile
  ln -s ~/dotfiles/profile/.profile ~/.profile
  echo 'profile done'
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
		mkdir ~/tmp
	fi
fi

if [[ $nerdfonts == y* ]]; then
	mkdir ~/Downloads/fonts
	wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf -P ~/Downloads/fonts
	if [ ! -d /usr/share/fonts/truetype ]; then
		mkdir /usr/share/fonts/truetype
	fi
	if [ ! -d /usr/share/fonts/opentype ]; then
		mkdir /usr/share/fonts/opentype
	fi
	sudo cp ~/Downloads/fonts/*.ttf /usr/share/fonts/truetype/
	sudo cp ~/Downloads/fonts/*.otf /usr/share/fonts/opentype/
	fc-cache
fi

if [ ~/tmp ]; then
	if [[ $do_vim == y* ]]; then
#		sudo apt install --assume-yes libncurses5-dev libncursesw5-dev
#		sudo apt remove vim
#		cd ~/tmp/
#		git clone --depth 1 https://github.com/vim/vim.git
#		echo "--------------------"
#		echo "Python path example:"
#		echo "/usr/lib/python3.8/config-3.8-x86_64-linux-gnu"
#		echo "Latest python path?"
#		read pyth_path
#		echo "Latest vim version? (Example: 82)"
#		read vim_version
#		cd vim
#		./configure --with-features=huge \
#			      --enable-multibyte \
#			      --enable-rubyinterp=yes \
#			      --enable-pythoninterp=yes \
#			      --enable-python3interp=yes \
#			      --with-python3-config-dir=$pyth_path \
#			      --enable-perlinterp=yes \
#			      --enable-luainterp=yes \
#			      --enable-gui=gtk2 --enable-cscope --prefix=/usr
#		make VIMRUNTIMEDIR=/usr/share/vim/vim$vim_version
#		sudo make install
		sudo apt install --assume-yes vim
#		sudo apt install --assume-yes vim-plug
		sudo apt install --assume-yes curl
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   		vim +PlugInstall +qall
  #  		cd ~
	fi
fi

if [[ $do_software == y* ]]; then
  sudo apt install --assume-yes ranger
  # sudo apt install --assume-yes rofi
  # sudo apt install --assume-yes manjaro-settings-manager
  # sudo apt install --assume-yes kitty
  # sudo apt install --assume-yes pulseaudio
  # sudo apt install --assume-yes neofetch
  # sudo apt install --assume-yes feh
  # sudo apt install --assume-yes scrot
  # sudo apt install --assume-yes flameshot
  # sudo apt install --assume-yes cowsay
  # sudo apt install --assume-yes fortune-mod
  sudo apt install --assume-yes xclip
  # sudo apt install --assume-yes clementine
  # sudo apt install --assume-yes gthumb
  sudo apt install --assume-yes filezilla
  # sudo apt install --assume-yes tmux
  sudo apt install --assume-yes fzf
  sudo apt install --assume-yes silversearcher-ag
  sudo apt install --assume-yes telegram-desktop
  sudo apt install --assume-yes unzip
  sudo apt install --assume-yes zip
  sudo apt install --assume-yes unrar
  sudo apt install --assume-yes timeshift
  # sudo apt install --assume-yes thunderbird
  # sudo apt install --assume-yes tk #fixes gitk
  # sudo apt install --assume-yes polybar
  # sudo apt install --assume-yes udevil
  # sudo apt install --assume-yes playerctl
  # sudo apt install --assume-yes unclutter
  # sudo apt remove palemoon-bin
  # sudo apt install --assume-yes youtube-dl
  # sudo apt install --assume-yes ntp && sudo timedatectl set-ntp true
  sudo apt install --assume-yes ncdu
  sudo apt install --assume-yes chromium-browser
  # sudo apt install --assume-yes albert
  sudo apt install --assume-yes gimp
  sudo apt install --assume-yes inkscape
  sudo apt install --assume-yes viewnior # image viewer
  sudo apt install --assume-yes pdfmod
  sudo apt install --assume-yes rhythmbox
  sudo apt remove hexchat

  # apt install --assume-yes xcursor-dmz
  # apt install --assume-yes google-chrome
  snap install spotify
  # apt install --assume-yes light-git
  # apt install --assume-yes slack-desktop
  sudo apt install --assume-yes gucharmap
  sudo apt install --assume-yes xmeasure

  # sudo apt install --assume-yes kdeconnect
  # sudo ufw allow 1714:1764/udp
  # sudo ufw allow 1714:1764/tcp
  # sudo ufw reload
fi

# if [[ $do_latex == y* ]]; then
  # sudo apt install --assume-yes texlive-most texlive-lang
# fi

if [[ $do_dev_software == y* ]]; then
  sudo apt install --assume-yes nodejs
  sudo apt install --assume-yes npm
  sudo npm i -g n
  sudo npm i -g eslint
  sudo npm i -g stylelint
  sudo npm i -g diff-so-fancy
  sudo apt install --assume-yes ctags
  sudo apt install --assume-yes ruby
#  sudo apt install --assume-yes lua51
fi

if [[ $do_vimium == y* ]]; then
  firefox https://addons.mozilla.org/de/firefox/addon/vimium-ff/
  chromium https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb/related
fi

echo ''
echo 'All done.'
