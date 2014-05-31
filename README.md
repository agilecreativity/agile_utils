## agile_utils

[![Gem Version](https://badge.fury.io/rb/agile_utils.svg)][gem]
[![Dependency Status](https://gemnasium.com/agilecreativity/agile_utils.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/agilecreativity/agile_utils.png)][codeclimate]

[gem]: http://badge.fury.io/rb/agile_utils
[gemnasium]: https://gemnasium.com/agilecreativity/agile_utils
[codeclimate]: https://codeclimate.com/github/agilecreativity/agile_utils

My collection of ruby libraries that I have used in more than one projects.
To promote the code re-use I move them all to this gem. Most of them are from a
well known gems, but some are written from scratch.
I hope you will find some of them useful for your interesting project.

Start from version `0.1.0`, the newer version will be released based on
the [Semantic Versioning][].

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
AgileUtils::Helper.linux?
AgileUtils::Helper.osx?
AgileUtils::Helper.make_list
AgileUtils::Helper.shell
AgileUtils::Helper.time
AgileUtils::Helper.uname
AgileUtils::FileUtil.find
AgileUtils::FileUtils.delete
AgileUtils::FileUtils.gunzip
AgileUtils::FileUtils.tar_gzip_files
```

### Contributing

1. Fork it ( http://github.com/agilecreativity/agile_utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Semantic Versioning]: http://semver.org
