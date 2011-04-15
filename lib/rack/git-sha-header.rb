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
      begin
        case body
          when ActionDispatch::Response
            if body.content_type == 'text/html'
              body.body << "\n<!-- #{@sha} -->\n"
            end
          when String
            if headers['Content-Type'].include?('text/html')
              body << "\n<!-- #{@sha} -->\n"
            end
        end
      rescue
      end
      [status, headers, body]
    end
    
  end
end
