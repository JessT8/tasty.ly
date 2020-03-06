class OnepageController < ApplicationController
  before_action :authenticate_user!
  def index
      redirect_to list_path
  end
end