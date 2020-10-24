class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def credit_register
  end

  def logout
    @user = User.find(params[:id])
  end
end
