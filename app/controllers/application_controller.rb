class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
    def after_sign_in_path_for(resource)
      if resource.class == User
        list_restaurants_path
      else
        ownerRestaurant_restaurants_path
      end
    end
end