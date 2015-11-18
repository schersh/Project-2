class ApartmentsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    authenticate_user!
    @user = current_user
    if current_user
      @apartment = current_user.apartment
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    unless @apartment.save
      redirect_to new_apartment_path
    end
    @apt_id = @apartment.id
    current_user.apartment_id = @apt_id
    if current_user.save
      redirect_to apartment_path (@apartment)
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
    @roommates = @apartment.users
    user = current_user
    @expenses = current_user.expenses
  end

  def edit

  end

  def update
    @apartment.update(apartment_params.merge(user: current_user))
      redirect_to apartment_path(@apartment, @user)
  end

  def destroy
    @apartment.destroy
    redirect_to apartment_path
  end

  private
    def apartment_params
      params.require(:apartment).permit(:name)
    end

    def set_post
      @apartment = Apartment.find(params[:id])
  end

end
