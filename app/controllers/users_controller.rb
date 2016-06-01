class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    cloudinary = Cloudinary::Uploader.upload params[:file]

    @user = User.new user_params
    @user.image = cloudinary["url"]
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    cloudinary = Cloudinary::Uploader.upload params[:file]

    user = User.find params[:id]
    user.image = cloudinary["url"] if cloudinary

    user.update user_params if user.authenticate( params[:username][:password] )

    redirect_to user
  end

  def destroy
    user = User.find params[:id]
    user.destroy

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :image, :name, :password, :password_confirmation)
  end
end
