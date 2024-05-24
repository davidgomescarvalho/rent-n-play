class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]
  def index
    @instruments = Instrument.all
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.create(instrument_params)
    @instrument.user = current_user
    @instrument.save!
    if @instrument.save
      redirect_to instrument_path(@instrument), notice: 'Your Instrument was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument), notice: 'Your instrument was successfully updated.'
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_path, notice: 'Your instrument was successfully destroyed.'
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:title, :body, :price, :location, :category, :availability)
  end
end
