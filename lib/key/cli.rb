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

    desc "sign <file>", "Sign the specified <file> with your default key"
    def sign(file = nil)
      # If no file is specified, open an editor to write a message.
      if file.nil?
        puts "Not implemented."
      end

      # Check the file exists and has a file size > 0
      puts `gpg --armor --clearsign #{file}` if File.size?(file)
    end

    desc "verify <file>", "Verify the signature of a file"
    def verify(file)
      puts `gpg --verify #{file}`
    end

    desc "encrypt <file> <recipient>", "Encrypt and sign <file> with your default key for <recipient>"
    def encrypt(file, recipient)
      puts `gpg --sign --armor --encrypt --recipient #{recipient} #{file}`
    end

    desc "decrypt <file>", "Decrypt <file> and output the results"
    def decrypt(file)
      puts `gpg --decrypt #{file}`
    end
  end
end
