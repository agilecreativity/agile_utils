# General library that can be re-use by multiple projects.
module AgileUtils
  # Store the options that will be shared by many CLI classes
  module Options

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
        desc: 'List of files without extension to search for',
        default: [] }
    ]

    INC_WORDS = [
      :inc_words,
      { type: :array,
        aliases: '-n',
        desc: 'List of words to be included in the result if any',
        default: [] }
    ]

    EXC_WORDS = [
      :exc_words,
      { type: :array,
        aliases: '-x',
        desc: 'List of words to be excluded from the result if any',
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

  end
end
