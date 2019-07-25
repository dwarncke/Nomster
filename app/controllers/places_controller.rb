class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :address, :description]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end

def edit
  @place = Place.find(params[:id])
  if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end
end

def update
  @place = Place.find(params[:id])
  if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end

  @place.update_attributes(place_params)
  redirect_to root_path
else
  render :edit, status: :unprocessable_entity
  end
end

def destroy
  @place = Place.find(params[:id])
  if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end


  @place.destroy
  redirect_to root_path
  end

  def address
    @place = current_user.places.address(place_params)
    if @place.valid?
    redirect_to root_path
  else
    render :new, status: :unprocessable_entitiy
  end
end

def description
  @place = current_user.places.description(place_params)
  if @place.valid?
    redirect_to root_path
  else
    render :new, status: :unprocessable_entitiy
  end
end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

