class BrowsingsearchController < ApplicationController
before_action :validate_access 
private 
  def validate_access 
      unless logged_in?
        redirect_to root_path
      end 
  end
end
