# Yournavigation
[![Gem Version](https://badge.fury.io/rb/yournavigation.svg)](http://badge.fury.io/rb/yournavigation)
[![Dependency Status](https://gemnasium.com/r-ideas/yournavigation.svg)](https://gemnasium.com/r-ideas/yournavigation)
[![Build Status](https://travis-ci.org/r-ideas/yournavigation.svg)](https://travis-ci.org/r-ideas/yournavigation)
[![Code Climate](https://codeclimate.com/github/r-ideas/yournavigation/badges/gpa.svg)](https://codeclimate.com/github/r-ideas/yournavigation)
[![Test Coverage](https://codeclimate.com/github/r-ideas/yournavigation/badges/coverage.svg)](https://codeclimate.com/github/r-ideas/yournavigation)

API wrapper for http://yournavigation.org

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yournavigation'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yournavigation

## Usage

```ruby
from = [38.5815719, -121.4943996] # Sacramento, US
to   = [37.3393857, -121.8949555] # San Jose, US
response = Yournavigation.gosmore from, to

response.distance    # 186.329841
response.traveltime  # 7205
response.description # "Continue on 9th Street. Follow the road for 0.2 mi.<br>.."
response.coordinates # [[-121.49442, 38.581577],
                     #  [-121.4945, 38.5814],
                     #  [-121.49465, 38.581045],
                     #  [-121.49481, 38.580673],
                     #  ...]
```

## Contributing

1. Fork it ( https://github.com/r-ideas/yournavigation/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
