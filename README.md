## agile_utils

Collection of ruby library that I have implemented and I use them in more
than one project. To promote the code re-use I move them all to this gem to promote the
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

May be not applicable, you would probably like to use this as library.
The only functionality that is provided is just the help to the list of APIs
that you can use.

```sh
# to show list of all available api
agile_utils
```

#### Use as standard ruby library

To use this you probably need to include it in your project.

```rb
## Require and include the library in your code
require 'agile_utils'
include AgileUtils

## call appropriate methods you like to use
AgileUtils::FileUtils.find()
AgileUtils::tar_gzip_files()
AgileUtils::time()
```

### Limitation/Known Issues

 - Will be listed here if any

### Changelogs

#### 0.0.1

- First initial release

#### 0.0.0

- Add basic structure for gem development

### Contributing

1. Fork it ( http://github.com/agilecreativity/agile_utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
