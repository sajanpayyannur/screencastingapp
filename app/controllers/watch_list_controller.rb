class WatchListController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js
  def watch_auction
    WatchList.create! :user_id => current_user.id, :auction_id => params[:id]
  end

  def index
    @watch_items = current_user.watch_lists
  end

  def destroy
    @watch_list = WatchList.find params[:id]
    @watch_list.delete
    redirect_to :action => :index
  end
end
