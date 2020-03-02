# VIM

## Intstallation
- Create symlink to .vimrc
	```sh
	$ ln -sf dotfiles/vim/.vimrc ~/.vimrc
	```
- Install nodejs:
  ```sh
  $ sudo pacman -S nodejs
  ```
- Source .vimrc from inside vim
  ```
  :so ~/.vimrc
  ```
- Install plugins from inside vim
  ```
  :PlugInstall
  ```
- Install  [the silver searcher](https://github.com/ggreer/the_silver_searcher)
	```sh
	$ sudo pacman -S the_silver_searcher
	```
