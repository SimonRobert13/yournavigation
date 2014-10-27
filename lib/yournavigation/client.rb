require 'active_support/all'
require 'httparty'
require 'yournavigation/gosmore_item'

module Yournavigation

  class Client
    include HTTParty

    base_uri 'http://yournavigation.org/api/1.0'

    attr_reader :fpoint, :tpoint, :options

    def initialize fpoint, tpoint, opts={}
      @fpoint = fpoint
      @tpoint = tpoint
      @options = default_options.merge opts
    end

    def gosmore
      if empty_points?
        GosmoreItem.new
      else
        parsed_response
      end
    end

    private

    def empty_points?
      fpoint.empty? && tpoint.empty?
    end

    def parsed_response
      GosmoreItem.parse request
    end

    def request
      resp = self.class.get '/gosmore.php', query: options
      resp = HashWithIndifferentAccess.new resp
      resp = resp.deep_symbolize_keys
      resp
    end

    def default_options
      {
        format:       :geojson,
        flat:         fpoint[0],
        flon:         fpoint[1],
        tlat:         tpoint[0],
        tlon:         tpoint[1],
        v:            :motocar,
        fast:         1,
        layer:        :mapnik,
        instructions: 1
      }
    end
  end

end
