class UserInstrumentsController < ApplicationController
  def index
    @instruments = current_user.instruments
  end
end
