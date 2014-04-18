require 'open3'
module AgileUtils
  module Helper
    class << self

      # Wrapper function to call the 'popen3' and return the result
      #
      # @param [Array<String>] commands list of command
      # @return [String] result of the command as the string
      def shell(commands = [])
        stdin, stderr, status = Open3.capture3(commands.join(" "))
        raise "Problem processing #{input_file}" unless status.success?
        stdin
      end

      def is_osx?
        uname && uname.strip.downcase == "darwin"
      end

      def is_linux?
        uname && uname.strip.downcase == "linux"
      end

      def uname
        shell(%w(uname))
      end

      # Extract "key1: value1\nkey2: value 2" to
      # hash of { "key1" => "value1", "key2" => "value 2" }
      #
      # @param [String] input the input string from the unix command
      # @return [Hash<Symbol,String>] result hash extracted from the command
      # @todo re-implement the code and look for specific list of keys and quit
      #       as fast as we get the specific list of keys
      def string_to_hash(input)
        hash = {}
        input.split("\n").each do |i|
          #TODO: code smell?
          item = i.split(":") if is_linux?
          item = i.split("=") if is_osx?
          next if item.empty? || item.size != 2
          hash[item[0].strip] = item[1].strip
        end
        hash
      end

      # Add suffix to each item in the list
      #
      # @param [Array<String>] list the input list
      # @param [String] suffix the suffix string
      # @return [Array<String.] list of input where each element is append with
      #  suffix string
      def add_suffix(list = [], suffix)
        list.map { |e| "#{e}.#{suffix}" }
      end

      # For tuning the operation
      def time
        beg_time = Time.now
        yield
        end_time = Time.now
        end_time - beg_time
      end

    end
  end
end
