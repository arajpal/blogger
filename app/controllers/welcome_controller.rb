class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token 
  skip_before_action :authenticate_user!, :only => "index", :raise => false

  def index
  end
end
