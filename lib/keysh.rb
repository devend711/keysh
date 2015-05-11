require 'thor'

module Keysh
  class Manager < Thor
    desc "config", "opens your ssh config file in vim"
    option :editor, :aliases => :e
    def config
      editor = options.has_key?("editor") ? options["editor"] : 'vim'
      system("#{editor} ~/.ssh/config")
    end

    desc "ssh <NAME>", "ssh to host NAME"
    def ssh(host_name)
      `ssh -T #{host_name}`
    end

    desc "clear", "clear SSH identities"
    def clear
      `ssh-add -D`
    end

    desc "add <ID>", "adds an rsa id ID key"
    def add(id_rsa_name)
      if !id_rsa_name.match(/^id_rsa_/)
        id_rsa_name = ('id_rsa_') + id_rsa_name
      end
      `ssh-add ~/.ssh/#{id_rsa_name}`
    end

    desc "rm <HOST_NAME>", "remove a known host"
    def rm(host_name)
      `ssh-keygen -R #{host_name}`
    end

    desc "assign <KEY> <HOST>", "specify a keyfile to assign to a host"
    def assign(key, host)
      `ssh -i #{key} #{host}`
    end

    desc "keys", "list your stored keys"
    def keys
      system('ssh-add -l')
    end

    desc "keygen", "create a new rsa SSH key"
    option :C, :aliases => :comment
    option :t ,:aliases => :type
    def keygen
      type = options.has_key?('t') ? options['t'] : 'rsa'
      comment = options.has_key?('C') ? " #{options['C']}" : ''
      `ssh-keygen -t #{type}#{comment}`
    end

    desc "gitconfig", "view local git config (or add --global to see global git config)"
    option :global
    def gitconfig
      global = options.has_key?("global") ? '--global' : ''
      system("git config #{global} --list")
    end

    desc "setgit", "sets git username (--u) and/or email (--e) locally (set globally with --global)"
    option :username, :aliases => :u
    option :email, :aliases => :e
    option :global
    def setgit
      global = options.has_key?("global") ? '--global' : ''
      if !options.has_key?("username") && !options.has_key?("email")
        puts "Pass a --username and/or --email option to set your git config"
        return
      end
      `git config #{global} user.name "#{options["email"]}"` if options.has_key?("username")
      `git config #{global} user.email #{options["password"]}` if options.has_key?("email")
    end
  end
end
