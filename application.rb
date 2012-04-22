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
      @answer = IsItEc2.ask(params[:ip]) ? 'YEP' : 'NOPE'
      haml :ip
    end
  end
end
