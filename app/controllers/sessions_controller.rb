class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:user_requested_path] || root_path
    else
      flash.now[:alert] = 'Verify your Email address and Password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete :user_requested_path
    redirect_to :login
  end
end
