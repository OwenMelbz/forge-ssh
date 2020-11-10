# Forge SSH

A simple companion tool which allows you to login to your Laravel Forge servers via their name.

> forge-ssh snowy-tree-fall

## Install

- `git clone` this repository somewhere safe :)
- Execute `forge-ssh/install.sh` to install symlink
- Generate a Forge API key from `https://forge.laravel.com`
- Paste the API key into `forge-ssh/forge.key`

## Updating server list

To cache your server list for lookups up use `forge-ssh update`.

To save bandwidth and speed, we look up from a cached version of the server list installed on your computer, rather than relying on contacting forge each time.

If you do not run `forge-ssh update` you will not see any servers to connect to.

You can see a full list of your cached servers by using `forge-ssh list`.

## Usage

From terminal just enter `forge-ssh server-name` and you should connect :)

If you use a custom SSH port or custom users etc, you can modify the `app.sh` to your hearts content.

## Bash Completion (DOESN'T YET WORK)

If you would like to use bash completion, you must load the `completion-forge-ssh.bash` with any of your other auto completions.
How to do this will depend on your computers configuration. As a one off task you can do `source completion-forge-ssh.bash`.

e.g. for macOS it's recommended to install the completion package e.g. `brew install bash-completion` and add the script to your `/usr/local/etc/bash_completion.d` directory as `forge-ssh`

Alternatively you can symlink it to keep it up to date for bug fixes e.g. `ln -s "PATH TO SCRIPT/completion-forge-ssh.bash" "/usr/local/etc/bash_completion.d/forge-ssh"`

You will need to check that your bash completion directory is loaded via your bash_profile e.g. `[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion`

ZSH users might need to add `autoload bashcompinit; bashcompinit` into their .zsh config.

## Dependencies

The script uses both Node and Bash to work, however it only uses the built in Node packages so no `npm install` is required.

## License

Do what you like with it, just don't claim it as your own - Attribute me at least :)
