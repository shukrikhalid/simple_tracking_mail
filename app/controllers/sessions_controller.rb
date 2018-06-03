class SessionsController < ApplicationController
  def new
  end

  def create
    user = Staff.find_by_staff_no(params[:staff_no])
    if user.blank?
      redirect_to login_url(staff_no: params[:staff_no]),alert: "Staff Number doesn't exist"
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
    	redirect_to login_url(staff_no: params[:staff_no]), alert: "Password is invalid"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out!"
  end
end
