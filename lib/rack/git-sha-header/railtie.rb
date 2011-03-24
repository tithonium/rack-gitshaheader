require 'rack/git-sha-header'
require 'rails'

module Rack
  class GitShaHeader
    class Railtie < Rails::Railtie
      initializer "gitshaheader.use_rack_middleware" do |app|
        app.config.middleware.use "Rack::GitShaHeader"
      end
    end
  end
end
