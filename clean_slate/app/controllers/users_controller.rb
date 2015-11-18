class UsersController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @expenses = current_user.expenses
    @apartment = current_user.apartment
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by params[:email]
    @user.temp_id = current_user.apartment_id
    if @user.save
      redirect_to apartment_path(current_user.apartment), notice: "You have successfully invited this roommate. Your roommate must log-in to accept or decline your invitation."
    end
  end

  def show
    @apartment = current_user.apartment
    @user = current_user.first_name
  end

  def update
    @apartment = current_user.apartment
    if current_user.apartment_id
      redirect_to apartment_path(@apartment)
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :temp_id)
  end

  def set_post
    @user = User.find(params[:id])
  end
end
