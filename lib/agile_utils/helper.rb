require 'open3'
require 'stringio'
module AgileUtils
  module Helper
    class << self
      # Wrapper function to call the 'popen3' and return the result
      #
      # @param [Array<String>] commands list of command
      # @return [String] result of the command as the string
      def shell(commands = [])
        begin
          command = commands.join(' ')
          stdin, _stderr, _status = Open3.capture3(command)
        rescue Exception => e
          raise "Problem processing #{command}, #{e.message}"
        end
        stdin
      end

      def is_osx?
        uname && uname.strip.downcase == 'darwin'
      end

      def is_linux?
        uname && uname.strip.downcase == 'linux'
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
        input.split('\n').each do |i|
          # TODO: code smell?
          item = i.split(':') if is_linux?
          item = i.split('=') if is_osx?
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

      # Good for capturing output from the :stdout
      # e.g. sample usage
      # output = capture(:stdout) { puts "Hello" }
      def capture(stream)
        begin
          stream = stream.to_s
          eval "$#{stream} = StringIO.new"
          yield
          result = eval("$#{stream}").string
        ensure
          eval("$#{stream} = #{stream.upcase}")
        end
        result
      end

      # Convert the hash options to list for use with Thor
      #
      # @param [Hash<Objects, Object>] options the option hash
      # @return [Array<String>] the list of options for use with Thor
      def make_list(options)
        list = []
        to_switches(options).split(' ').each do |a|
          list << a.gsub('"', '')
        end
        list
      end

      # Cross-platform way of finding an executable in the $PATH.
      #
      # @param command [String] the command to look up
      # @return [String, NilClass] full path to the executable file or nil if the
      #  executable is not valid or available.
      # Example:
      #   which('ruby')           #=> /usr/bin/ruby
      #   which('/usr/bin/ruby')  #=> nil
      #   which('bad-executable') #=> nil
      def which(command)
        exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
        ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
          exts.each do |ext|
            exe = File.join(path, "#{command}#{ext}")
            return exe if File.executable? exe
          end
        end
        nil
      end

      private

      # https://github.com/erikhuda/thor/blob/master/lib/thor/parser/options.rb
      #
      # Receives a hash and makes it switches.
      def to_switches(options)
        options.map do |key, value|
          case value
          when true
            "--#{key}"
          when Array
            "--#{key} #{value.map { |v| v.inspect }.join(' ')}" unless value.empty?
          when Hash
            "--#{key} #{value.map { |k, v| "#{k}:#{v}" }.join(' ')}" unless value.empty?
          when nil, false
            ''
          else
            "--#{key} #{value.inspect}"
          end
        end.join(' ')
      end
    end
  end
end
