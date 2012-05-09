module Tencent
  module Interface
  
    # The Base class of API
    class Base
      def initialize(client)
        @client = client
      end
      
      def base_params
        {
          :format => 'json', 
          :access_token => @client.token.token, 
          :oauth_consumer_key => Tencent::Config.api_key,
          :openid => @client.openid
        }
      end
      
      def request(verb, path, opts={}, &block)
        unless @client.is_authorized?
          raise "I can't find a valid access_token. Forgot to get it or expired?"
        end
        begin
          response = @client.token.request(verb, path, opts, &block)
          
        rescue Exception => e
          e.message
        end
        # raise Error.new(response) if response.error
        JSON response.response.env[:body]
      end
      
      def get(path, opts={}, &block)
        request(:get, path, opts, &block)
      end
      
      def post(path, opts={}, &block)
        request(:post, path, opts, &block)
      end
    end
    
  end
end
