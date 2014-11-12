[![Build Status](https://travis-ci.org/manasg/yahsort.svg?branch=master)](https://travis-ci.org/manasg/yahsort)

[![Gem Version](https://badge.fury.io/rb/yahsort.svg)](http://badge.fury.io/rb/yahsort)

# Yahsort (Yet Another Human Sorter)

Easier to read sorted list of hostnames for those who still care* :)

Ofcourse you don't need this if you use zero padded hostnames - web01, web02

Usually

```
irb(main):001:0> %w{ web1 web10 web11 web2 }.sort 
=> ["web1", "web10", "web11", "web2"]

```

Ideally

```
=> ["web1", "web2", "web10", "web11"]
```

## Installation

Add this line to your application's Gemfile:

    gem 'yahsort'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yahsort

## Usage

```
require 'yahsort'

puts %w{ web1 web10 web11 web2 }.sort &Yahsort.sorter
```

## Contributing

1. Fork it ( https://github.com/manasg/yahsort/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

*[Stop worrying about prodweb001](http://www.slideshare.net/AmazonWebServices/stop-worrying-about-prodweb001-and-start-loving-i98fb9856-arc201-aws-reinvent-2013)
