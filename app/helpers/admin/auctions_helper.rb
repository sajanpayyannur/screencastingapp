module Admin::AuctionsHelper
  def auction_status_tag(auction)
    auction.enabled?? "Enabled" : "Closed"
  end
end
