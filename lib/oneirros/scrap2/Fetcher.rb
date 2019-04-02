require 'mechanize'

module Oneirros
  module Scrap2
    class Fetcher

      def initialize()
        @agent = Mechanize.new
      end

      def fetch(target) 
        result = @agent.get(target)
	return result
      end

    end
  end
end
