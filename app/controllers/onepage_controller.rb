class OnepageController < ApplicationController
  before_action :authenticate_user!
  def index
      redirect_to favRestaurantList_path
  end
end