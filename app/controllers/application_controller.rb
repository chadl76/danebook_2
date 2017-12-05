class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  #before_action :set_user

  private

  #def set_user
  ##	@user = current_user
  #end

  #def after_sign_in_path_for(resource)
 #	redirect_to user_timeline_path(resource)
 # end
end
