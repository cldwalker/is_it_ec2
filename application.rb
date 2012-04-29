require 'bundler'
Bundler.require(:default, (ENV['RACK_ENV'] || :development).to_sym)

$:.unshift File.dirname(__FILE__) + '/lib'
require 'is_it_ec2'

module My
  class Application < Sinatra::Base
    if ENV['RACK_CACHE']
      use Rack::Cache do
        set :verbose, true
        set :metastore,   'heap:/'
        set :entitystore, 'heap:/'
      end
    end

    get '/' do
      cache_control :public, :max_age => 600
      haml :index
    end

    get '/:ip' do
      etag params[:ip]
      begin
        @answer = IsItEc2.ask(params[:ip]) ? 'YEP' : 'NOPE'
      rescue Resolv::ResolvError
        halt 404, "Address '#{params[:ip]}' does not exist"
      end
      haml :ip
    end
  end
end
