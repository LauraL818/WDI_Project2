class StadiaController < ApplicationController
  def index
    @stadiums = Stadium.all
  end

  def show
    @stadium = Stadium.find(params[:id])
  end
end
