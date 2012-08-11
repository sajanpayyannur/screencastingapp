class PagesController < ApplicationController
  def show
    @page = Admin::Page.find params[:id]
  end
end
