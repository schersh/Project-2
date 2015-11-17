class UsersController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @expenses = current_user.expenses
  end


  def show
    @apartment = Apartment.find(params[:apartment_id])
    @user = User.where(apartment_id == @apartment.id)

  end


  private
  def set_post
    @user = User.find(params[:id])
  end
end
