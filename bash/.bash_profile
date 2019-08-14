#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

eval `keychain --clear --eval --quiet --agents ssh ~/.ssh/id_rsa`
