class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :new, :edit, :create, :update,:destroy, :ownerRestaurant ]
   before_action :authenticate_owner!, except: [:individualFavRestaurant, :favRestaurant, :deleteRestaurant, :index,:list]

#owners

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find_by_id(params[:id])
    @food = @restaurant.foods
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner_id = current_owner.id
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to ownerRestaurant_url }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end
  def ownerRestaurant
        @restaurants = Restaurant.where(owner: current_owner.id)
  end
  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #users
    # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    #get not favorite restaurants
    # @user = User.find_by_id(current_user.id)
    # @restaurants = Restaurant.left_outer_joins(:users).where(users: { id: nil } )
  end

  def list
      @user = User.find_by_id(current_user.id)
      @restaurants = @user.restaurants
  end

  def individualFavRestaurant
    @restaurant = Restaurant.find_by_id(params[:id])
    @food = @restaurant.foods
    @user = User.find_by_id(current_user.id)
    @checkedFood = @user.foods.where(restaurant_id: params[:id] )
    if @restaurant.users.exists?(@user.id)
      @present = true
    else
      @present = nil
    end
  end

  def favRestaurant
    @restaurants = Restaurant.find_by_id(params[:id])
    @user = User.find_by_id(current_user.id)
    respond_to do |format|
      if @restaurants.users << @user
        format.html { redirect_to individualFavRestaurant_url(params[:id]), notice: 'Restaurant was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: individualFavRestaurant_url(params[:id]), status: :unprocessable_entity }
      end
    end
  end

  def deleteRestaurant
     @restaurants = Restaurant.find(params[:id])
     @user = User.find(current_user.id)
     @restaurants.users.delete(@user)
     respond_to do |format|
      format.html { render 'restaurants/individualFavRestaurant'}
      end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :image_url, :description, :owner_id)
    end
    def food_params
      params.require(:food).permit(:id)
    end
end