class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end
  # GET /foods/1
  # GET /foods/1.json
  def show
  end
  def favFood
    @foods = Food.find_by_id(params[:id])
    @restaurant = @foods.restaurant
    @user = User.find_by_id(current_user.id)
    respond_to do |format|
      if @foods.users << @user
        format.html { redirect_to individualFavRestaurant_url(@restaurant.id)}
      else
        format.html { render :new }
        format.json { render json: individualFavRestaurant_url(@restaurant.id), status: :unprocessable_entity }
      end
    end
  end
  def deleteFood

     @foods = Food.find(set_food.id)
     @restaurant = @foods.restaurant
     @user = User.find(current_user.id)
     @foods.users.delete(@user)
     respond_to do |format|
      format.html { redirect_to individualFavRestaurant_url(@restaurant.id), notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def list
    # @restaurants = Restaurant.joins(:foods).select("categories.*, COUNT(issues.id) AS issues_count").group('categories.id')
    @user = User.find(current_user.id);
    @foods = @user.foods
    @count = @foods.group(:restaurant).count
    @restaurants = @count.keys
    @favorites = @count.values
  end
  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)
    @food.restaurant_id = params[:id]
    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :price, :restaurant_id)
    end
end