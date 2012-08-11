class Admin::AuctionsController < Admin::BaseController
  respond_to :html
  def index
    @auctions = Auction.page(params[:page]).order('end_date desc')
  end

  def show
    @auction = Auction.find params[:id]
    respond_with(@auction)
  end
end
