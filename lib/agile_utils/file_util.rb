module AgileUtils
  module FileUtil
    require 'zlib'
    require 'minitar'

    class << self
      CustomError = Class.new(StandardError)
      # Find list of files based on certain extension
      #
      # @param [String] base_dir the starting directory
      # @param [String] extension the file extension to search for
      #
      # @return [Array<String>] list of matching files or empty list
      # rubocop:disable CollectionMethods
      def find(base_dir, extension = "xhtml")
        file_paths = []
        Find.find(base_dir) do |path|
          file_paths << path if path =~ /.*\.#{extension}$/
        end
        file_paths
      end
      # rubocop:enable All

      # @param [Array<String>] files list of input files
      # @param [String] output the output file in .tar.gz format
      def tar_gzip_files(files, output="output.tgz")
        Minitar.pack(files, Zlib::GzipWriter.new(File.open(output, 'wb')))
      end

      # Uncompress 'input.tar.gz' file
      #
      # @param [String] filename input file in the 'tar.gzip' format
      # @param [String] output_dir the output directory
      def gunzip(filename, output_dir)
        input_file = File.open(filename, "rb")
        tgz = Zlib::GzipReader.new(input_file)
        Archive::Tar::Minitar.unpack(tgz, output_dir)
      end

      # Delete the files from the given list
      #
      # @param files list of files to be deleted
      def delete(files)
        files.each do |file|
          FileUtils.rm_rf(file)
        end
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
