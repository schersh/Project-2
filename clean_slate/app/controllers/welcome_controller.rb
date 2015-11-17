class WelcomeController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    authenticate_user!
    if current_user.apartment
      redirect_to apartment_path(current_user.apartment)
    end 
  end

end
