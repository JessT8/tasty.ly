class OnepageController < ApplicationController

  def index
    if current_owner
      redirect_to ownerRestaurant_path
    elsif current_user
      redirect_to favRestaurantList_path
    else
      redirect_to user_session_path
    end
  end
end