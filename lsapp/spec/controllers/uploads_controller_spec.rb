require 'spec_helper'

describe UploadsController do
  include Devise::TestHelpers
  render_views
  
  before do
    User.create! :email => 'foo@foo.com', :password => 'foobar', :password_confirmation => 'foobar'
    sign_in User.find_by_email 'foo@foo.com'
  end
  
  describe "GET 'new'" do
    before do
      get :new
    end
    
    it 'be valid' do
      response.should be_success
    end
    
    it 'render new' do
      response.should render_template 'uploads/new'
    end
  end
  
  describe "GET 'create'" do
    it 'when file empty' do
      post :create
      flash[:alert].should_not be_empty
    end
    
    it 'render new when invalid' do
      post :create
      response.should render_template 'uploads/new'
    end
    
    it 'when valid file specified' do
      csv_file = Rack::Test::UploadedFile.new "#{::Rails.root}/spec/example_input.tab"
      post :create, :upload => csv_file
      response.should contain "$95.0"
    end
    
    it 'render show when valid' do
      csv_file = Rack::Test::UploadedFile.new "#{::Rails.root}/spec/example_input.tab"
      post :create, :upload => csv_file
      response.should render_template 'uploads/show'
    end
  end
  
end