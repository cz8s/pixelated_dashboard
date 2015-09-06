require 'dashing'

configure do
  if ENV.has_key?('PIX_AUTH_TOKEN')
    set :auth_token, ENV['PIX_AUTH_TOKEN']
  else
    set :auth_token, 'ie2Aex6ooLi4usi0ahngaht'
  end
  set :default_dashboard, 'pixelated'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
