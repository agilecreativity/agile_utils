## agile_utils

[![Gem Version](https://badge.fury.io/rb/agile_utils.svg)](http://badge.fury.io/rb/agile_utils)
[![Dependency Status](https://gemnasium.com/agilecreativity/agile_utils.png)](https://gemnasium.com/agilecreativity/agile_utils)
[![Code Climate](https://codeclimate.com/github/agilecreativity/agile_utils.png)](https://codeclimate.com/github/agilecreativity/agile_utils)

My collection of ruby library that I have used in more than one project.
To promote the code re-use I move them all to this gem.
I hope you will find some of them useful for your interesting project.

### Installation

Add this line to your application's Gemfile:

    gem 'agile_utils'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install agile_utils

### Usage

```rb
# Require and include the library in your code
require 'agile_utils'
include AgileUtils

# Then call the right method to use.
AgileUtils::Helper.capture
AgileUtils::Helper.is_linux?
AgileUtils::Helper.is_osx?
AgileUtils::Helper.make_list
AgileUtils::Helper.shell
AgileUtils::Helper.time
AgileUtils::Helper.uname

AgileUtils::FileUtil.find()
AgileUtils::FileUtils.delete()
AgileUtils::FileUtils.gunzip()
AgileUtils::FileUtils.tar_gzip_files()
```

### Changelogs

#### 0.0.9

- Update minitest to latest version

#### 0.0.8

- Move '--theme' option out as it is not a shared option

#### 0.0.7

- Remove the `default_options` from `base_option.rb`

- Update the description for `base_option.rb`

#### 0.0.6

- Fix the `-f` options description

#### 0.0.5

- Correct the short option for '--exc-words'

- Show list of apis for default usage

#### 0.0.3 - 0.0.4

- Add more functions

- Code refactoring and cleanup

#### 0.0.2

- First initial release

### Contributing

1. Fork it ( http://github.com/agilecreativity/agile_utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
