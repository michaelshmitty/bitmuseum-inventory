class Users::RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_url
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
