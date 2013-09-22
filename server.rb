#!/usr/bin/env ruby

require 'sinatra'
require 'rest-client'

CLIENT_ID = ENV['GH_CLIENT_ID']
CLIENT_SECRET = ENV['GH_SECRET_ID']

get '/' do
  erb :index, :locals => {
    :client_id => CLIENT_ID,
    :scopes => 'gist'
  }
end

# get '/callback' do
#   # get temporary GitHub code...
#   session_code = request.env['rack.request.query_hash']["code"]
#   # ... and POST it back to GitHub
#   result = RestClient.post("https://github.com/login/oauth/access_token",
#                           {:client_id => CLIENT_ID,
#                            :client_secret => CLIENT_SECRET,
#                            :code => session_code
#                           },{
#                            :accept => :json
#                           })
#   access_token = JSON.parse(result)["access_token"]
# end