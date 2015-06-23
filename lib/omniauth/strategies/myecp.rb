require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class MyECP < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "myecp"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site:           "https://my.ecp.fr",
        authorize_url:  "/oauth/v2/auth",
        token_url:      "/oauth/v2/token"
        }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :name => raw_info['first_name'] + " " + raw_info['last_name'],
          :email => raw_info['mail'],
          :nickname => raw_info['login'],
          :first_name => raw_info['first_name'], 
          :last_name => raw_info['last_name']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/m').parsed
      end
    end
  end
end
