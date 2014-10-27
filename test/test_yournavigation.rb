require 'minitest_helper'

class TestYournavigation < MiniTest::Unit::TestCase
  def setup
    VCR.insert_cassette 'base'
  end

  def teardown
    VCR.eject_cassette
  end

  def test_that_it_has_a_version_number
    refute_nil ::Yournavigation::VERSION
  end

  def test_gosmore_default_request
    from = [38.5815719, -121.4943996] # Sacramento, US
    to   = [37.3393857, -121.8949555] # San Jose, US

    response = Yournavigation.gosmore from, to

    assert_match    /Continue on Capitol Mall/, response.description
    assert_equal    response.traveltime, 7205
    assert_equal    response.coordinates.size, 1544
    assert_in_delta response.distance, 186, 0.33
  end
end
