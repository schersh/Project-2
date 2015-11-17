class WelcomeController < ApplicationController
  def index
    @apartment = Apartment.find(params[:apartment_id])
    @user = current_user.find(params[:_id])
  end
end
