class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        reset_session
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.login}!"
        redirect_to '/calc/input'
      else
        flash[:warning] = 'Invalid e-mail or password'
        redirect_to '/sessions/new'
        return
      end
    else
      flash[:warning] = 'Invalid e-mail or password'
      redirect_to '/sessions/new'
      return
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Signed out successfully'
    redirect_to '/calc/input'
  end
end
