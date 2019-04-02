require_relative 'LoginHandler'

module Oneirros
  module Scrap2
    class FacebookLoginHandler < LoginHandler

      def initialize(playerid, hash, accesstoken = nil) 
        super(playerid, hash)
        @accesstoken = accesstoken
      end

      def login()
        result = @agent.get("https://rivalregions.com/?viewer_id=#{@playerid}&id=#{@playerid}&access_token=#{@accesstoken}&hash=#{@hash}")
        @agent.cookie_jar.save('oneirros-mechanized-cookies.yaml', session: true)
      end

    end
  end
end
