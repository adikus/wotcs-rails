class ApplicationController < ActionController::Base
  include RegionHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :initialize_js_environment
  before_action :check_region

  # initializes the request variables
  def initialize_js_environment
    # initialize javascript container
    @js = {}
    # populate the identifier of the current page
    @js[:page] = "#{params[:controller]}.#{params[:action]}"
  end

  def check_region
    if params[:region]
      set_current_region params[:region]
    end
  end

end
