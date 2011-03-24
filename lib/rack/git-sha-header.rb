require 'rubygems'
begin
  require 'rails'
rescue LoadError
end

require 'rack/git-sha-header/railtie' if defined?(Rails::Railtie)

module Rack
  class GitShaHeader
    VERSION = "0.0.1"
    
    def initialize(app)
      @app = app
      @sha = `git rev-parse HEAD`.chomp
    end
    
    def call(env)
      status, headers, body = @app.call(env)
      headers['X-GitSHA'] = @sha
      [status, headers, body]
    end
    
  end
end
