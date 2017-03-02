class UsersController < ApplicationController

before_action :authenticate_user!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
      @user = User.new user_params
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Logged In!"
      else
       render :new
     end
   end

   def edit
       @user = current_user
   end


  def update
     @user = current_user
      if @user.update user_params
        redirect_to root_path, notice: 'account updated'
        else
        render :edit
      end
  end

  def change_password
    if current_user.update user_params
      redirect_to edit_user_path(current_user), notice: 'password updated'
    else
      render :edit
    end

  end

  def destroy
    current_user.destroy
    redirect_to user_path
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
