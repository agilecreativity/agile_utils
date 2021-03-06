module AgileUtils
  module Options
    BASE_DIR = [
      :base_dir,
      { type:    :string,
        aliases: "-b",
        desc:    "Base directory",
        default: Dir.pwd
      }
    ]

    EXTS = [
      :exts,
      { type: :array,
        aliases: "-e",
        desc: "List of extensions to search for",
        default: []
      }
    ]

    NON_EXTS = [
      :non_exts,
      { type: :array,
        aliases: "-f",
        desc: "List of files without extension to search for",
        default: [] }
    ]

    INC_WORDS = [
      :inc_words,
      { type: :array,
        aliases: "-n",
        desc: "List of words in the filename to be included with the result if any",
        default: []
      }
    ]

    EXC_WORDS = [
      :exc_words,
      { type: :array,
        aliases: "-x",
        desc: "List of words in the filename to be excluded from the result if any",
        default: []
      }
    ]

    IGNORE_CASE = [
      :ignore_case,
      { type: :boolean,
        aliases: "-i",
        desc: "Ignore the case in the input filename",
        default: true
      }
    ]

    RECURSIVE = [
      :recursive,
      { type: :boolean,
        aliases: "-r",
        desc: "Search for files recursively",
        default: true
      }
    ]

    VERSION = [
      :version,
      { type: :boolean,
        aliases: "-v",
        desc: "Display version information",
        default: false
      }
    ]
  end
end
