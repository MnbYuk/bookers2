class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configiure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    @user = current_user.id
    user_path(@user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configiure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end
