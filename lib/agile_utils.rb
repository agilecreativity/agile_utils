# Make use of core_extension (don't invent the wheel)
require 'active_support'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/kernel/reporting'

require_relative "./agile_utils/version"
require_relative "./agile_utils/cli"
require_relative "./agile_utils/helper"
require_relative "./agile_utils/file_util"
require_relative "./agile_utils/base_option"
