## agile_utils

[![Gem Version](https://badge.fury.io/rb/agile_utils.svg)](http://badge.fury.io/rb/agile_utils)

My collection of ruby library that I have implemented and plan to use them in more
than one project. To promote the code re-use I move them all to this gem
DRY (Don't repeat yourself). I hope you will find some of them useful for you
interesting project.

### Installation

Add this line to your application's Gemfile:

    gem 'agile_utils'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install agile_utils

### Usage

#### Use as CLI

As this gem is intended to be used as a library in other application.
I plan to show the available command/api when the command is executed.

```sh
# to show list of all available api
agile_utils
```

#### Use as standard ruby library

This is how the gem supposed to be used.

```rb
# Require and include the library in your code
require 'agile_utils'
include AgileUtils

# call appropriate methods you like to use
AgileUtils::FileUtil.find()
AgileUtils::FileUtils.tar_gzip_files()
AgileUtils::FileUtils.delete()
```

### Limitation/Known Issues

 - Will be listed here if any

### Changelogs

#### 0.0.2

- First initial release

### Contributing

1. Fork it ( http://github.com/agilecreativity/agile_utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
