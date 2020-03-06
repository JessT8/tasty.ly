class OnepageController < ApplicationController
  before_action :authenticate_owner!
  def index
  end
end