desc "Updates the auctions that has end_date < Time.zone.now"
task :cron => :environment do
  if Time.now.hour % 1 == 0 # run every four hours
    puts "Updating disabled auctions..."
    Auction.set_as_disabled
    puts "done."
  end
end
