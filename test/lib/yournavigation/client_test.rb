require 'minitest_helper'

class TestYournavigationClient < Minitest::Unit::TestCase

  def setup
    VCR.insert_cassette 'base'
    @from_point = [38.5815719, -121.4943996] # Sacramento, US
    @to_point   = [37.3393857, -121.8949555] # San Jose, US
  end

  def teardown
    VCR.eject_cassette
  end

  def test_gosmore_request_with_default_options
    @client = Yournavigation::Client.new @from_point, @to_point
    response = @client.gosmore

    assert_match    /Continue on Capitol Mall/, response.description
    assert_equal    response.traveltime, 7205
    assert_equal    response.coordinates.size, 1544
    assert_in_delta response.distance, 186, 0.33
  end

  def test_gosmore_request_to_return_only_distance
    options = {instructions: false}
    @client = Yournavigation::Client.new @from_point, @to_point, options
    response = @client.gosmore

    assert_empty    response.description
    assert_equal    response.traveltime, 7205
    assert_equal    response.coordinates.size, 1544
    assert_in_delta response.distance, 186, 0.33
  end

  def test_gosmore_request_without_points
    @client = Yournavigation::Client.new [], []
    response = @client.gosmore

    assert_empty response.description
    assert_equal response.traveltime, 0
    assert_empty response.coordinates
    assert_equal response.distance, 0
  end

end
