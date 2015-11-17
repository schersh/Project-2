class ApartmentsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    authenticate_user!
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
    @apartment = Apartment.create(apartment_params.merge(user: current_user))
    redirect_to apartments_path(@apartment, @user), notice: "#{@apartment.name} was successfully created!"
  end

  def show

  end

  def edit

  end

  def update
    @apartment.update(apartment_params.merge(user: current_user))
      redirect_to apartments_path(@apartment, @user)
  end

  def destroy
    @apartment.destroy
    redirect_to apartments_path
  end

  private
    def apartment_params
      params.require(:apartment).permit(:name)
    end

    def set_post
      @apartment = Apartment.find(params[:id])
  end

end
