require 'thor'
require_relative '../agile_utils'
module AgileUtils
  class CLI < Thor
    desc 'main', 'Main entry point'
    def main
      opts = options.symbolize_keys
      if opts[:version]
        puts "You are using #{AgileUtils::PROJECT_NAME} version #{AgileUtils::VERSION}"
        exit
      end
      execute(opts)
    end

    desc "usage", "Display help screen"
    def usage
      puts <<-EOS
      Add your usage here.
      EOS
    end

    default_task :usage

    private

    # @param [Hash<Symbol, Object>] options the options argument
    def execute(options = {})
      puts "FYI: execute with options: #{options}"
    end

  end
end
