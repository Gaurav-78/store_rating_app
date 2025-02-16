class UsersController < ApplicationController
  before_action :authenticate_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end



  def dashboard
    @user = User.find(session[:user_id]) 
     end

def show
  @user = User.find(params[:id])
end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # ✅ Logs in user after sign-up
      redirect_to root_path, notice: "Account created successfully!"
    else
      render :new  # ✅ If validation fails, reload sign-up page with errors
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_dashboard_path, notice: 'User updated successfully.'
    else
      render :edit
    end
  end

  def edit_password
  @user = current_user
end

def update_password
  @user = current_user
  if @user.update(user_params)
    redirect_to stores_path, notice: "Password updated successfully"
  else
    render :edit_password
  end
end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User deleted successfully.'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :address, :role)

  end

   def authenticate_user
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in first."
    end
  end
end