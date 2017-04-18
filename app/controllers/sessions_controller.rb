class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password credentials!'
      render :new
    end

    # if user = User.authenticate_with_credentials(params[:email], params[:password])
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    #   redirect_to '/login'
    # end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
