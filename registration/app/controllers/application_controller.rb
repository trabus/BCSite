class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin?

  protected

  def load_current_event
    @current_event = Event.last
  end

  def admin?
    session[:password] == 'bc'
  end

  def authorize
    unless admin?
      flash[:notice] = "You are not authorized to access this page."
      redirect_to home_path
      false
    end
  end
end
