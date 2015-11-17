class WelcomeController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    authenticate_user!
    if current_user
      @apartment = current_user.apartment
    else
      redirect_to new_user_registration_path
    end
  end

end
