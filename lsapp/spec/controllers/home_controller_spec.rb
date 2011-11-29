require 'spec_helper'

describe HomeController do
  include Devise::TestHelpers
  
  describe "GET 'index'" do
    before do
      get :index
    end
    
    it 'should be success' do
      response.should be_success
    end
    
    it 'should render index template' do
      response.should render_template :index
    end
  end
  
end