class WatchListMailer < ActionMailer::Base
  default from: "info@internetautoauctions.com"

  def notify_interaction(auction)
    @auction = auction
    mail subject: "Notification - AutoBidMaster - Updated Watch List Item", to: auction.watchers_emails
  end
end
