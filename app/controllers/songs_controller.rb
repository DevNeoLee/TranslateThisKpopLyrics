class SongsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user, except: [:index, :show]

  def index
    @songs = Song.all.reverse
  end

  def new
    @song = Song.new
    @song.albums.build.songs.build 
  end

  # def show 
  #   @song = Song.find(Song_params[:id])
  # end

  def edit 
    @song = Song.find(song_params[:id])
  end

  def update 
    @song.title = song_params[:title]
    @song.profile = song_params[:profile]
    @song.save 
  end

  def create
    song = Song.new(song_params)
    if Song.save! 
      redirect_to root_path
    else 
      redirect_to new_Song_path
    end
  end

  def destroy
    Song.destroy(song_params[:id])

    redirect_to root_path
  end

  private
  def song_params
    params.permit(:title, :korean_lyrics, :romaja_lyrics, :id, :album_id)
  end

  def admin_user
    unless current_user.admin? 
      redirect_to new_user_session_path
    end
  end
end
