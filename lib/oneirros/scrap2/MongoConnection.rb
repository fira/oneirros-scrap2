require 'mongo'

module Oneirros
  module Scrap2
    class MongoConnection

      def initialize(host = "127.0.0.1", port = "27017", database = "oneirros")
        @mongo = Mongo::Client.new([ "#{host}:#{port}" ], :database => database)
      end
    
    end
  end
end
