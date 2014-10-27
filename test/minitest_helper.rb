$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yournavigation'

require 'minitest/autorun'
require 'turn'
require 'pry'

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/vcr_cassettes'
  c.hook_into :webmock
end

Turn.config.format = :dot
