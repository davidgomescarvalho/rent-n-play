class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    if params[:query].present?
      @instruments = Instrument.global_search(params[:query])
    else
      @instruments = Instrument.all
    end
  end

  def show
    @markers =
      [{
        lat: @instrument.latitude,
        lng: @instrument.longitude,
        info_Window: render_to_string(partial: "info_window", locals: { instrument: @instrument }),
        marker_html: render_to_string(partial: "marker")
      }]
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save!
    if @instrument.save
      flash[:notice] = "Instrument was successfully created."
      redirect_to instrument_path(@instrument), notice: 'Your Instrument was successfully created.'
    else
      flash[:alert] = @instrument.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to instrument_path(@instrument), notice: 'Your instrument was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_path, notice: 'Your instrument was successfully destroyed.'
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def correct_user
    redirect_to instruments_path, alert: 'Not authorized to delete this instrument.' unless @instrument.user == current_user
  end

  def instrument_params
    params.require(:instrument).permit(:title, :body, :price, :location, :category, :availability, :start_date, :end_date, photos: [])
  end
end
