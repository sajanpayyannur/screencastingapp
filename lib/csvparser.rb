class CSVParser < Mechanize::File
  attr_reader :csv

  # Saves the csv on tmp/ dir so it can be uploaded to s3 later on
  def initialize uri = nil, response = nil, body = nil, code = nil
    super uri, response, body, code

    File.open("#{Rails.root}/tmp/#{filename}", 'w') do |file|
      file.write body
    end

    @csv = CSV.parse body
  end

  def import_csv
    n, errs = 0, []
    @csv.each do |row|
      n += 1
      next if n == 1 or row.join.blank?
      auction = Auction.build_from_csv(row)
      next if auction.persisted?
      if auction.save
        puts "Imported auction #{auction.id}"
      else
        errs << row[7]
      end
    end

    puts "There might be an error with some auctions. Please check the ones with lot numbers: #{errs.inspect}." if errs.any?
  end

  def filename
    @filename ||= "#{Time.now.to_i}.csv"
  end
end
