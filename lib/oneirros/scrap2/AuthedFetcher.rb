require_relative 'Fetcher'

module Oneirros
  module Scrap2
    class AuthedFetcher < Fetcher

      def initialize(loginhandler)
        super()
        @loginhandler = loginhandler
        @loginhandler.login()
        @agent.cookie_jar.load("oneirros-mechanized-cookies.yaml")
      end

      def fetch(target)
        result = super(target)

        logcheck = /Session expired, please, reload the page/ =~ result.css("script").text;
        if not logcheck.nil? 
          puts "[DEBUG] Logged Out... Trying to relog with Handler"
          @loginhandler.login()
          @agent.cookie_jar.load("oneirros-mechanized-cookies.yaml")
          result = super(target)
        end

        return result
      end

    end
  end
end
