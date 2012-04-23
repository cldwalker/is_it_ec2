require 'bundler'
Bundler.require(:default, (ENV['RACK_ENV'] || :development).to_sym)

$:.unshift File.dirname(__FILE__) + '/lib'
require 'is_it_ec2'

module My
  class Application < Sinatra::Base
    get '/' do
      haml :index
    end

    get '/:ip' do
      begin
        @answer = IsItEc2.ask(params[:ip]) ? 'YEP' : 'NOPE'
      rescue Resolv::ResolvError
        halt 404, "Address '#{params[:ip]}' does not exist"
      end
      haml :ip
    end
  end
end
