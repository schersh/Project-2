class ExpensesController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    authenticate_user!
    @user = current_user
    if current_user
      @expenses = current_user.expenses
    else
      redirect_to new_user_session_path
    end
  end

  def show
  end

  def new
      @user = current_user
      @expense = Expense.new
  end

  def create
      current_user.expenses.create(expense_params)
      redirect_to expenses_path(current_user), notice: "#{@expense.description} was successfully created!"
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @expense.update(expense_params.merge(user: current_user))
    if @expense.update(expense_params)
      flash[:notice] = "You have successfully update this expense"
    end
    render :index
  end

  def destroy
    @apartment = Apartment.find(params[:apartment_id])
    @expense.destroy
    redirect_to expenses_path(current_user)
  end

  private
  def expense_params
    params.require(:expense).permit(:created_at, :amount, :description)
  end

  def set_post
    @expense = Expense.find(params[:id])
  end

end
