require 'yournavigation/version'
require 'yournavigation/client'

module Yournavigation extend self

  def gosmore fpoint, tpoint, opts={}
    client = Client.new fpoint, tpoint, opts
    client.gosmore
  end

end
