class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path] ? cookies[:path] : tests_path
    else
      flash.now[:alert] = 'Verify your Email address and Password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete :path
    redirect_to :login
  end
end
