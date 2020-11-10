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

## Usage

From terminal just enter `forge-ssh server-name` and you should connect :)

If you use a custom SSH port or custom users etc, you can modify the `app.sh` to your hearts content.

## Dependencies

The script uses both Node and Bash to work, however it only uses the built in Node packages so no `npm install` is required.

## License

Do what you like with it, just don't claim it as your own - Attribute me at least :)
