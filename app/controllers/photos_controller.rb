class PhotosController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    @photo = Photo.new
    @photos = Photo.where(user_id: (params[:user_id].presence || current_user.id) )
  end

  def new
    @photo = Photo.new
  end

  def create
    user = current_user
    photo = user.photos.new photo_params
    file = uploadfile photo.photo_file
    photo.file = file
    if photo.save
      respond_to do |format|
        format.js {}
        format.html
      end
    else
      redirect_to new_photo_path, alter: 'error'
    end
  end

  def show

  end

  private
  def photo_params
    params.require(:photo).permit(:title, :photo_file)
  end

  def uploadfile photo_file

    file = Time.now.to_i.to_s + photo_file.original_filename
    FileUtils.mkdir("#{Rails.root}/public/upload") unless File.exist?("#{Rails.root}/public/upload")
    File.open("#{Rails.root}/public/upload/#{file}", "wb") do |f|
      f.write(photo_file.read)
    end
    return file
  end
end