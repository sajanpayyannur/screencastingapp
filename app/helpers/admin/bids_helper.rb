module Admin::BidsHelper
  def bid_status_tag(bid)
    if bid.winner
      "Winner"
    elsif !bid.active
      "Canceled"
    elsif bid.auction.enabled
      "Pending"
    else
      "Closed"
    end
  end
end
