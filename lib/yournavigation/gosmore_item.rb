require 'hashie/trash'

module Yournavigation
  class GosmoreItem < Hashie::Trash
    property :distance, default: 0, transform_with: lambda { |v| v.to_f }
    property :traveltime,  default: 0, transform_with: lambda { |v| v.to_i }
    property :coordinates, default: []
    property :description, default: '',
                           transform_with: lambda { |v| !!(v =~ /To enable simple instructions/) ? '' : v}

    def self.parse data
      item = new data[:properties]
      item.coordinates = data[:coordinates]
      item
    end

  end
end
