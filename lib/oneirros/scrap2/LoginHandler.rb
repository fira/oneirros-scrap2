require 'mechanize'

module Oneirros
  module Scrap2
    class LoginHandler
      
      def initialize(playerid, hash)
        @playerid = playerid
        @hash = hash 
        @agent = Mechanize.new
      end

      def login()
        raise "LoginHandler is Not Implemented"
      end
    end
  end
end
