class SessionsController < ApplicationController

  def new # login page-- user/new form?
    render :new
  end

  def create # login user
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ['User not found!']
      render :new
    end
  end

  def destroy
    logout!(@user)
    redirect_to new_session_url
  end

end
