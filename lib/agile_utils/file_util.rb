require 'zlib'
require 'stringio'
require 'find'
require 'fileutils'
require 'archive/tar/minitar'

module AgileUtils
  include Archive::Tar
  include Archive::Tar::Minitar

  module FileUtil

    class << self
      # @todo use me when you have to!
      CustomError = Class.new(StandardError)

      # Find list of files based on certain extension
      #
      # @param [String] base_dir the starting directory
      # @param [String] extension the file extension to search for
      #
      # @return [Array<String>] list of matching files or empty list
      def find(base_dir, extension = 'xhtml')
        file_paths = []
        Find.find(base_dir) do |path|
          file_paths << path if path =~ /.*\.#{extension}$/
        end
        file_paths || []
      end

      # Tar and gzip list of files
      #
      # @param [Array<String>] files list of input files
      # @param [String] output the output file in .tar.gz format
      def tar_gzip_files(files, output = 'output.tar.gz')
        begin
          sgz = Zlib::GzipWriter.new(File.open(output, 'wb'))
          tar = Minitar::Output.new(sgz)
          files.each do |file|
            Minitar.pack_file(file, tar)
          end
        ensure
          # Closes both tar and sgz.
          tar.close unless tar.nil?
          tar = nil
        end
      end

      # Delete the files from the given list
      def delete(files)
        # Note: should we remove the files and be done with it?
        files.each do |file|
          #puts "FYI: about to delete file #{file}"
          # Note: name clash!!!
          FileUtils.rm_rf(file)
        end
      end

      # Add suffix to each extensions
      #
      # @param [Array<String>] extensions list of extension
      # @param [String] suffix the suffix string
      #
      # @return [Array<String>] new list with the suffix added to each element
      def add_suffix(extensions = %w(rb pdf), suffix)
        extensions.map {|e| "#{e}.#{suffix}" }
      end

      # Time the operation before and after the operation for tuning purpose
      def time
        beg_time = Time.now
        yield
        end_time = Time.now
        end_time - beg_time
      end
    end
  end
end

if __FILE__ == $0
  include AgileUtils
  files = AgileUtils::FileUtil.find('test/fixtures/inputs', 'rb')
  puts files
  AgileUtils::FileUtil.tar_gzip_files files, 'test/fixtures/output.tar.gz'
  puts "Your output is at #{File.absolute_path('test/fixtures/output.tar.gz')}"
  puts "About to delete your file.."
  #AgileUtils::FileUtil.delete ['test/fixtures/output.tar.gz']
end