require 'spec_helper'

describe My::Application do
  describe "GET /:ip" do
    def stub_ask(arg, ret)
      unless ENV['LIVE']
        IsItEc2.should_receive(:ask).with(arg).and_return(ret)
      end
    end

    it "returns YEP for an ec2 website" do
      stub_ask 'heroku.com', true
      get '/heroku.com'

      last_response.status.should == 200
      body.should =~ /YEP/
    end

    it "returns NOPE for a non-ec2 website" do
      stub_ask 'github.com', false
      get '/github.com'

      last_response.status.should == 200
      body.should =~ /NOPE/
    end

    it "returns 404 for invalid ip" do
      get '/0.0.0'

      last_response.status.should == 404
      body.should == "Address '0.0.0' does not exist"

    end
  end
end
