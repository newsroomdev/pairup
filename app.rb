require 'rack/ssl'
require 'sinatra/auth/github'

module Example
  class BadAuthentication < Sinatra::Base
    get '/unauthenticated' do
      status 403
      <<-EOS
      <h2>Unable to authenticate, sorry bud.</h2>
      <p>#{env['warden'].message}</p>
      EOS
    end
  end

  class SimpleApp < Sinatra::Base
    enable  :sessions
    enable :raise_errors
    disable :show_exceptions
    enable :inline_templates

    set :github_options, {
      :scope => 'user',
      :secret => ENV['GH_CLIENT_SECRET'],
      :client_id => ENV['GH_CLIENT_ID']
    }
    register Sinatra::Auth::Github

    get '/' do
      erb :index
    end

    get '/profile' do
      authenticate!
      erb :profile
    end

    get '/login' do
      authenticate!
      redirect '/'
    end

    get '/logout' do
      logout!
      redirect '/'
    end
  end

  def self.app
    @app ||= Rack::Builder.new do
      run SimpleApp
    end
  end
end