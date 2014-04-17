require 'thor'
require_relative '../agile_utils'
module AgileUtils

  class CLI < Thor
    desc 'main', 'Main entry point'

    # TODO: adjust if required
    method_option :commit,
                  aliases: "-c",
                  desc: "commit your changes",
                  default: false
    def main
      opts = options.symbolize_keys

      if opts[:version]
        puts "You are using #{AgileUtils::PROJECT_NAME} version #{AgileUtils::VERSION}"
        exit
      end

      puts "FYI: your options #{opts}"
      execute(opts)
    end

    desc "usage", "Display help screen"
    def usage
      #TODO: add your usage here (How to automate this task from Vim?)
      # try running :r !./bin/agile_utils help run
      puts <<-EOS
      TODO: Add your usage here.
      EOS
    end

    default_task :usage

    private

    # @param [Hash<Symbol, Object>] options the options argument
    def execute(options = {})
      #TODO: add your logic here
      puts "FYI: execute with options: #{options}"
    end

  end
end
