class SearchController < ApplicationController
  before_action :set_cities, only: :index

  def index
    render json: Hotel.where(city_id: @cities.ids).matching_term(params[:q] || '').hotels_data
  end

  private

  def set_cities
    @cities = City.where(name: params[:city]).presence || City.all
  end
end
