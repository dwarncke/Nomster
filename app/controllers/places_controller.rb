class PlacesController < ApplicationController

  def index
    @places = Place.all
    ap Place.first
  end

end
