class ConcertsController < ApplicationController
  def show
    @concert = Concert.find(params[:id])
  end
  def concerts_by_city
    @city_name = params[:name]
    @concerts = Concert.where("city = ?",@city_name).order(:date)
    render 'index'
  end
end
