class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = current_user
    @profile = Profile.new
  end

  def edit
       @user = current_user
       @profile = Profile.new
  end

  def show
    @user = current_user
    @profile = Profile.find_by(params[:id])
  end

  def update

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    if @profile.save
      redirect_to newsfeed_path(current_user)
    end
  end

  def destroy
  end

  private 

  def profile_params
    params.require(:profile).permit(
                :birthday,
                :hometown,
                :college,
                :words_to_live_by,
                :user_id)
  end
end
