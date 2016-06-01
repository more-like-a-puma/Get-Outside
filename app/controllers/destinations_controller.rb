class DestinationsController < ApplicationController
  def index
    if params[:search].present?
      @destinations = Destination.near(params[:search])
    else
      @destinations = Destination.all
    end
  end

  def new
    @destination = Destination.new
  end

  def create
    cloudinary = Cloudinary::Uploader.upload params[:file]

    @destination = Destination.new destination_params
    @destination.image = cloudinary["url"]
    if @destination.save
      redirect_to destinations_path
    else
      render :new
    end
  end

  def show
    @destination = Destination.find params[:id]
  end

  def edit
    @destination = Destination.find params[:id]
  end

  def update
    @user = User.find params[:id]

    cloudinary = Cloudinary::Uploader.upload params[:file]

    destination = Destionation.find params[:id]
    destination.image = cloudinary["url"] if cloudinary

    destination.update destination_params if @user.authenticate( params[:username][:password] )

    redirect_to destination
  end

  def destroy
    destination = Destination.find params[:id]
    destination.destroy

    redirect_to destinations_path
  end

  private
  def destination_params
    params.require(:user).permit(:address, :country, :image, :title, :description, :terrain)
  end
end
