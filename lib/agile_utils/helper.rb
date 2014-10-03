module AgileUtils
  module Helper
    class << self
      # Wrapper function to call the 'popen3' and return the result
      #
      # @param [Array<String>] commands list of command and arguments to be executed
      # @return [String] result of the command as the string
      # @raise [RuntimeError] an exception to raise when the command result in error
      def shell(commands = [])
        begin
          command = commands.join(" ")
          stdin, _stderr, _status = Open3.capture3(command)
        rescue => e
          raise "Problem processing #{command}, #{e.message}"
        end
        stdin
      end

      def osx?
        RbConfig::CONFIG["host_os"] =~ /darwin/
      end

      def linux?
        RbConfig::CONFIG["host_os"] =~ /linux/
      end

      # Wrap the call to `uname` command
      def uname
        shell(%w[uname])
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
        to_switches(options).split(" ").each do |a|
          list << a.gsub('"', "")
        end
        list
      end

      # Cross-platform way of finding an executable in the $PATH.
      #
      # @param [String] command the command to look up
      # @return [String, NilClass] full path to the executable file or nil if the
      #  executable is not valid or available.
      # Example:
      #   which('ruby')           #=> /usr/bin/ruby
      #   which('/usr/bin/ruby')  #=> nil
      #   which('bad-executable') #=> nil
      def which(command)
        exts = ENV["PATHEXT"] ? ENV["PATHEXT"].split(";") : [""]
        ENV["PATH"].split(File::PATH_SEPARATOR).each do |path|
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
            "--#{key} #{value.map { |v| v.inspect }.join(" ")}" unless value.empty?
          when Hash
            "--#{key} #{value.map { |k, v| "#{k}:#{v}" }.join(" ")}" unless value.empty?
          when nil, false
            ""
          else
            "--#{key} #{value.inspect}"
          end
        end.join(" ")
      end
    end
  end
end
