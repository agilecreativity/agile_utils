# General library that can be re-use by multiple projects.
module AgileUtils
  # Store the options that will be shared by many CLI classes
  module Options
    # Common options {{{
    BASE_DIR = [
      :base_dir,
      { type: :string,
        aliases: '-b',
        desc: 'Base directory',
        default: Dir.pwd }
    ]

    EXTS = [
      :exts,
      { type: :array,
        aliases: '-e',
        desc: 'List of extensions to search for',
        default: [] }
    ]

    NON_EXTS = [
      :non_exts,
      { type: :array,
        aliases: '-f',
        desc: 'List of extensions to search for',
        default: [] }
    ]

    INC_WORDS = [
      :inc_words,
      { type: :array,
        aliases: '-n',
        desc: 'List of words to be included in the result',
        default: [] }
    ]

    EXC_WORDS = [
      :exc_words,
      { type: :array,
        aliases: '-x',
        desc: 'List of words to be excluded from the result',
        default: [] }
    ]

    IGNORE_CASE = [
      :ignore_case,
      { type: :boolean,
        aliases: '-i',
        desc: 'Match case insensitively',
        default: true }
    ]

    RECURSIVE = [
      :recursive,
      { type: :boolean,
        aliases: '-r',
        desc: 'Search for files recursively',
        default: true }
    ]

    VERSION = [
      :version,
      { type: :boolean,
        aliases: '-v',
        desc: 'Display version information',
        default: false }
    ]
    # }}}

    # Options related to 'VimPrinter' only {{{
    THEME = [
      :theme,
      { type: :string,
        aliases: '-t',
        desc: 'Vim colorscheme to use',
        default: 'default' }
    ]
    # }}}

    # The default options text from the above options
    def default_usage
      <<-EOT
Options:
  -b, [--base-dir=BASE_DIR]                # Base directory
                                           # Default: . (current directory)
  -e, [--exts=one two three]               # List of extensions to search for
  -f, [--non-exts=one two three]           # List of extensions to search for
  -n, [--inc-words=one two three]          # List of words to be included in the result
  -x, [--exc-words=one two three]          # List of words to be excluded from the result
  -i, [--ignore-case], [--no-ignore-case]  # Match case insensitively
                                           # Default: true
  -r, [--recursive], [--no-recursive]      # Search for files recursively
                                           # Default: true
  -v, [--version], [--no-version]          # Display version information
      EOT
    end
  end
end
