module CSVAuctionImport

  #  CSV DESCRIPTION
  #
  #  0 - Yard number         11 - Model Group            22 - Odometer         33 - High Bid =non-vix,Sealed=Vix
  #  1 - Yard name           12 - Model Detail           23 - Odometer Brand   34 - Special Note
  #  2 - Sale Date M/D/CY    13 - Body Style             24 - Lot ACV          35 - Location city
  #  3 - Day of Week         14 - Color                  25 - Repair cost      36 - Location state
  #  4 - Sale time (HHMM)    15 - Damage Description     26 - Engine           37 - Location ZIP
  #  5 - Time Zone           16 - Secondary Damage       27 - Drive            38 - Location country
  #  6 - Item#               17 - Sale Title State       28 - Transmission     39 - Currency Code
  #  7 - Lot number          18 - Sale Title Type        29 - Fuel Type        40 - Image Thumbnail
  #  8 - Vehicle Type        19 - Has Keys-Yes or No     30 - Cylinders        41 - Create Date/Time
  #  9 - Year                20 - Lot Cond. Code         31 - Runs/Drives      42 - Grid/Row
  #  10 - Make               21 - VIN                    32 - Sale Status      43 - Make-an-Offer Eligible

  def build_from_csv(row)
    a = Auction.find_by_lot_number(row[7])
    if a.nil?
      a = Auction.new
      a.title                  = row[10] + " " + row[11]
      a.mark                   = row[10]
      a.model                  = row[11]
      a.vehicle_condition      = row[20]
      a.price                  = row[25]
      a.drive_train            = row[27]
      a.transmission           = row[28]
      a.city                   = row[35]
      a.state                  = row[36]
      a.zip_code               = row[37]
      a.end_date               = DateTime.parse(row[2] + " " + row[4]) rescue Time.now
      a.kind                   = row[8]
      a.year                   = row[9]
      a.make_an_offer_eligible = row[43]
      a.buy_it_now_price       = row[44]
      a.color                  = row[14]
      a.body_style             = row[13]
      a.mileage                = row[22].to_f rescue 0
      a.damage_description     = row[15]
      a.secundary_damage       = row[16]
      a.title_state            = row[17]
      a.vin                    = row[21]
      a.picture_url            = "http://"+row[40]
      a.lot_number             = row[7]
      a.yard_number            = row[0]
      a.yard_name              = row[1]
      a.day_of_week            = row[3]
      a.model_group            = row[11]
      a.model_detail           = row[12]
      a.sale_title_type        = row[18]
      a.has_keys               = row[19]
      a.odometer_brand         = row[23]
      a.lot_acv                = row[24]
      a.engine                 = row[26]
      a.fuel_type              = row[29]
      a.cylinders              = row[30]
      a.run_drives             = row[31]
      a.sale_status            = row[32]
      a.high_bid               = row[33].to_f rescue 0
      a.special_note           = row[34]
      a.country                = row[38]
      a.currency_code          = row[39]      
    end
    a
  end
end
