class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in!"
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
    # 
    # def edit
    #   # session = session[:user_id]
    #   # session[:user_id] = current_user.id
    #   @user = User.find params[:id]
    #
    #   if @user.update user_params
    #     redirect_to root_path, notice: 'account updated'
    #   else
    #     render :edit
    #   end
    # end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end


private

  def user_params
    params.require(:user).permit(:first_name,
                               :last_name,
                               :email,
                               :password,
                               :password_confirmation)
  end
end
