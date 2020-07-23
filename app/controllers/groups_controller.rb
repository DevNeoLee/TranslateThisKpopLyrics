class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user, except: [:index, :show]

  def index
    @groups = Group.all.reverse
    @albums = Album.all.reverse
    @songs = Song.all.reverse 
  end

  def new
    @group = Group.new
    @group.albums.build.songs.build 
  end

  def create
    group = Group.new(group_params)

    if group.save! 
      redirect_to root_path
    else 
      redirect_to new_group_path
    end
  end

  def destroy
    Group.destroy(group_params[:group_id])

    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:title, :profile, albums_attributes: [:title, :release_date, songs_attributes: [:title, :korean_lyrics, :romaja_lyrics]])
  end

  def admin_user
    unless current_user.admin? 
      redirect_to new_user_session_path
    end
  end
end
