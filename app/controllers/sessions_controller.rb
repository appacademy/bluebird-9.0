class SessionsController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]

  def new
  end

  def create
    # 1. Find the user
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    # 2. Did we find the user in db?
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["INVALID CREDENTIALS"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end











end