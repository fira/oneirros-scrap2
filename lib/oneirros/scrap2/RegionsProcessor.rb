require 'pp'
require_relative 'RegionsParser'

module Oneirros
  module Scrap2
    class RegionsProcessor < RegionsParser
      def initialize(fetcher, mongo)
        @fetcher = fetcher
        @mongo = mongo
        super()
      end

      def run()
        page = @fetcher.fetch('http://rivalregions.com/info/regions')
        data = self.parse(page)
  
        data.each { |region|

          @mongo[:regions].replace_one(
            { 'regionid': region["regionid"] },
            region, 
            { 'upsert': true }
          ) unless region["regionid"].nil?

          @mongo[:regions].update_one(
            { 'regionid': region["regionid"] },
            { :$currentDate => { 
              :updated => true
              } 
            }
          ) 
        }
      end
    end
  end
end
