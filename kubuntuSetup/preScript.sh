clear
echo '##############################'
echo '#                            #'
echo "#   Janis's Kubuntu Setup    #"
echo '#                            #'
echo '##############################'
echo '#                            #'
echo "#         PreScript          #"
echo '#                            #'
echo '##############################'


sudo apt install --assume-yes git

echo 'Enter git username'
read username
echo 'Enter git email'
read email
echo 'Enter git name'
read name
echo "[user]" > ~/dotfiles/git/user.gitconfig
echo "  username = $username" >> ~/dotfiles/git/user.gitconfig
echo "  email = $email" >> ~/dotfiles/git/user.gitconfig
echo "  name = $name" >> ~/dotfiles/git/user.gitconfig
# echo 'Setting git global credentials:'
# git config --global user.email "$email"
# git config --global user.name "$name"
# echo 'Done.'

echo "Update & Upgrade" &&
sudo apt update &&
sudo apt dist-upgrade &&
echo
echo "Cleaning Up" &&
sudo apt-get autoremove --purge &&
sudo apt-get autoclean &&
sudo apt-get clean

echo 'xclip required. Downloading now.'
sudo apt install xclip

echo 'Creating SSH-Key'
ssh-keygen -t rsa -b 4096 -C "$email"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

xclip -sel clip < ~/.ssh/id_rsa.pub
echo 'Done.'

echo 'Add to github. Redirecting now.'
xdg-open https://github.com/settings/keys
