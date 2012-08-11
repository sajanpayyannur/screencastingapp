class Users::RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      # Sign in the user by passing validation in case his password changed
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      respond_with @user, :location => after_update_path_for(@user)
    else
      render "edit"
    end
  end
end