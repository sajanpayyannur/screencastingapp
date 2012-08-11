class Admin::BidsController < Admin::BaseController
  respond_to :html
  def index
    @user = User.find params[:user_id]
    @bids = @user.bids
  end

  def show
    @user = User.find params[:user_id]
    @bid = Bid.find params[:id]
  end

  def mark_as_won
    @user = User.find params[:user_id]
    @bid = Bid.find params[:id]
    @bid.mark_as_won
    render :action => :show
  end

  def mark_as_lost
    binding.pry
    @user = User.find params[:user_id]
    @bid = Bid.find params[:id]
    @bid.mark_as_lost
    render :action => :show
  end
end
