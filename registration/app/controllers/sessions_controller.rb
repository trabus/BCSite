class SessionsController < ApplicationController
  def create
    session[:password] = params[:password]
    unless admin?
      flash[:notice] = 'Login failed'
      redirect_to login_path
    else
      flash[:notice] = 'Login successful'
      redirect_to home_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Logout successful'
    redirect_to login_path
  end
end
