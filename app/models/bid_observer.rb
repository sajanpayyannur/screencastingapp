class BidObserver < ActiveRecord::Observer
  def after_create(bid)
    WatchListMailer.notify_interaction(bid.auction).deliver
  end
end
