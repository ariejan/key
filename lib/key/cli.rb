require 'thor'

module Key
  class CLI < Thor

    desc "version", "Show version information"
    def version
      puts "Key v#{Key::VERSION}"
    end

  end
end
