class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def create
    @instrument = Instrument.create(instrument_params)

    redirect_to instrument_path(@instrument)
  end

  def new
    @instrument = Instrument.new
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    redirect_to instruments_path
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end 

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  private

  def instrument_params
    params.require(:instrument).permit(:instrument_type, :manufacturer, :brand)
  end
end
