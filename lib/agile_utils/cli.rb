require "thor"
module AgileUtils
  class CLI < Thor
    desc "usage", "Display help screen"
    def usage
      puts <<-EOS
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
