class Admin::BaseController < ApplicationController
  before_filter :check_user_admin
  layout 'one_column'

  private
    def check_user_admin
      redirect_to root_url unless current_user.has_role? 'admin'
    end
end
