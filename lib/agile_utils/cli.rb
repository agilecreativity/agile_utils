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
# List of available APIs
require 'agile_utils'
include AgileUtils

# Make a call to any of the following
AgileUtils::Helper.capture
AgileUtils::Helper.is_linux?
AgileUtils::Helper.is_osx?
AgileUtils::Helper.make_list
AgileUtils::Helper.shell
AgileUtils::Helper.time
AgileUtils::Helper.uname

AgileUtils::FileUtil.find()
AgileUtils::FileUtils.delete()
AgileUtils::FileUtils.gunzip()
AgileUtils::FileUtils.tar_gzip_files()
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
