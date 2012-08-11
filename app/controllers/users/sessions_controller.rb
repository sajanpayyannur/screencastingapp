class Users::SessionsController < Devise::SessionsController

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(:user, @user)
      if current_user.try(:admin?)
        redirect_to admin_pages_url
      else 
        respond_with(@user, :location => after_sign_in_path_for(@user))
      end
    else
      set_flash_message(:alert, :invalid)
      render "new"
    end
  end
end
