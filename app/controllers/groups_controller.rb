class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user, except: [:index, :show]

  def index
    @groups = Group.all.reverse
  end

  def new
    @group = Group.new
    @group.albums.build.songs.build 
  end

  # def show 
  #   @group = Group.find(group_params[:id])
  # end

  def edit 
    @group = Group.find(group_params[:id])
  end

  def update 
    @group.title = group_params[:title]
    @group.profile = group_params[:profile]
    @group.save 
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to root_path
    else 
      render new_group_path
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to root_path
    else 
      raise params.inspect
    end
  end

  private
  def group_params
    params.require(:group).permit(:title, :profile, albums_attributes: [:title, :release_date, :id, :_destroy, songs_attributes: [:title, :korean_lyrics, :romaja_lyrics, :id, :_destroy]])
  end

  def admin_user
    unless current_user.admin? 
      redirect_to new_user_session_path
    end
  end
end
