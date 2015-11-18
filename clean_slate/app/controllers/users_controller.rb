class UsersController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @expenses = current_user.expenses
  end


  def show
    @apartment = current_user.apartment
    @user = current_user.name
  end

  def new
    @user = User.invite!(:email => params[:user][:email], :name => params[:user][:name])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password)
  end
  def set_post
    @user = User.find(params[:id])
  end
end
