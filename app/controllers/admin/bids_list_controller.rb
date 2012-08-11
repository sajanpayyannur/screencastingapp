class Admin::BidsListController < Admin::BaseController
  respond_to :html
  def index
    @bids = Bid.page(params[:page]).order('created_at desc')
  end

  def show
    @bid = Bid.find params[:id]
  end

  def bids_list_csv
    csv = CSV.generate do |csv|
      csv << [:auction, :lot_number, :auction_price, :bidder, :value, :winner, :created_at]
      Bid.all.each do |bid|
          line = Array.new

          line << bid.auction.title
          line << bid.auction.lot_number
          line << (bid.auction.price) || " - "
          line << (bid.user.email) || " -  "
          line << (bid.value) || " -  "
          line << (bid.winner) || " -  "
          line << I18n.l(bid.created_at, format: :short)

          csv << line
      end
    end
    respond_to do |format|
      format.csv {send_data(csv, :file_name => 'users_list.csv', :type => 'text/csv')}
    end
  end

end
