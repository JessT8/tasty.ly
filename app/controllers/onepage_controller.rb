class OnepageController < ApplicationController
  before_action :authenticate_user!
  def index
      redirect_to restaurants_url
  end
end