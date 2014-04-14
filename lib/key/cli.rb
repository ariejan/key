require 'thor'

module Key
  class CLI < Thor

    desc "version", "Show version information"
    def version
      puts "Key v#{Key::VERSION}"
    end

    desc "list", "List key information, shows only public keys by default"
    option :secret,
      type: :boolean,
      default: false,
      desc: "Only list secret keys"
    option :sigs,
      type: :boolean,
      default: false,
      desc: "Show signatures for public keys"
    def list
      if options[:secret]
        puts `gpg --list-secret-keys`
      else
        if options[:sigs]
          puts `gpg --list-sigs`
        else
          puts `gpg --list-keys`
        end
      end
    end
  end
end
