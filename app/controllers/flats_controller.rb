class FlatsController < ApplicationController

  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @flats = Flat.where("name LIKE ?", "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat
    else
      render :new
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def edit
  end

  def update
  end

  def destroy 
    @flat.destroy
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to flats_url, alert: 'Flat not found.' }
      format.json { head :no_content }
    end
  end
end
