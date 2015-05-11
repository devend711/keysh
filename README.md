# Keysh

Manage your SSH keys and identities with ease! SSH and Git settings all in one command-line tool.

## Installation

Add this line to your application's Gemfile:

    gem 'keysh'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install keysh

## Usage

run `keysh help` for help!

Commands:
  keysh add <ID>             # adds an rsa id ID key
  keysh assign <KEY> <HOST>  # specify a keyfile to assign to a host
  keysh clear                # clear SSH identities
  keysh config               # opens your ssh config file in vim
  keysh gitconfig            # view local git config (or add --global to see global git config)
  keysh help [COMMAND]       # Describe available commands or one specific command
  keysh keygen               # create a new rsa SSH key
  keysh keys                 # list your stored keys
  keysh rm <HOST_NAME>       # remove a known host
  keysh setgit               # sets git username (--u) and/or email (--e) locally (set globally with --global)
  keysh ssh <NAME>           # ssh to host NAME

## Contributing

1. Fork it ( https://github.com/[my-github-username]/keysh/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
