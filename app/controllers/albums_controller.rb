class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user, except: [:index, :show]

  def index
    @albums = Album.all.reverse
  end

  def new
    @album = Album.new
  end

  # def show 
  #   @album = album.find(album_params[:id])
  # end

  def edit 
    @Album = Album.find(album_params[:id])
  end

  def update 
    @Album.title = album_params[:title]
    @Album.profile = album_params[:profile]
    @Album.save 
  end

  def create
    album = Album.new(album_params)
    if album.save! 
      redirect_to root_path
    else 
      redirect_to new_album_path
    end
  end

  def destroy
    Album.destroy(album_params[:id])

    redirect_to root_path
  end

  private
  def album_params
    params.permit(:title, :korean_lyrics, :romaja_lyrics, :id, :group_id)
  end

  def admin_user
    unless current_user.admin? 
      redirect_to new_user_session_path
    end
  end
end

