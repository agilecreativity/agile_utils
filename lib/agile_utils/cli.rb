require "thor"
require_relative "../agile_utils"
module AgileUtils
  class CLI < Thor
    desc "main", "Main entry point"
    def main
      opts = options.symbolize_keys
      if opts[:version]
        puts "You are using AgileUtils version #{AgileUtils::VERSION}"
        exit
      end
    end
    desc "usage", "Display help screen"
    def usage
      puts <<-EOS
# List of available APIs
require 'agile_utils'
include AgileUtils

# General methods
AgileUtils::Helper.capture
AgileUtils::Helper.make_list
AgileUtils::Helper.shell
AgileUtils::Helper.linux?
AgileUtils::Helper.osx?
AgileUtils::Helper.time
AgileUtils::Helper.uname
AgileUtils::FileUtil.find()
AgileUtils::FileUtils.delete()
AgileUtils::FileUtils.gunzip()
AgileUtils::FileUtils.tar_gzip_files()
      EOS
    end

    default_task :usage
  end
end
