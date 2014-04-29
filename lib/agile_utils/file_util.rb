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
      # @todo rename to tar_gzip(..)
      def tar_gzip_files(files, output = 'output.tar.gz')
        sgz = Zlib::GzipWriter.new(File.open(output, 'wb'))
        tar = Archive::Tar::Minitar::Output.new(sgz)
        files.each do |file|
          Archive::Tar::Minitar.pack_file(file, tar)
        end
      ensure
        # Closes both tar and sgz.
        tar.close unless tar.nil?
        tar = nil
      end

      # Uncompress 'input.tar.gz' file
      #
      # @param [String] filename input file in the 'tar.gzip' format
      # @param [String] output_dir the output directory
      def gunzip(filename, output_dir)
        input_file = File.open(filename, 'rb')
        tgz = Zlib::GzipReader.new(input_file)
        # Warning: tgz will be closed!
        Archive::Tar::Minitar.unpack(tgz, output_dir)
      # ensure
        # input_file = nil unless input_file.nil?
      end

      # Delete the files from the given list
      #
      # @param files list of files to be deleted
      # @todo add ! to flag it as destructive!
      def delete(files)
        files.each do |file|
          FileUtils.rm_rf(file)
        end
      end

      # Add suffix to each extensions
      #
      # @param [Array<String>] extensions list of extension
      # @param [String] suffix the suffix string
      #
      # @return [Array<String>] new list with the suffix added to each element
      def add_suffix(extensions = [], suffix)
        extensions.map { |e| "#{e}.#{suffix}" }
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
