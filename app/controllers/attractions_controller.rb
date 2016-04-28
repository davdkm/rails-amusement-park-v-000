class AttractionsController < ApplicationController

  def index
    if current_user.present?
      @attractions = Attraction.all
    else
      redirect_to root_path, flash: {error: 'You must be logged in to do that.'}
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction), flash: {notice: 'Successfully created an attraction.'}
    else
      redirect_to attractions_path, flash: {notice: 'There was a problem creating the attraction.'}
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction), flash: {notice: 'Successfully updated an attraction.'}
    else
      redirect_to attractions_path, flash: {notice: 'There was a problem updating the attraction.'}
    end
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
