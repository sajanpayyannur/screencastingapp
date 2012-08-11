class Mileage
  attr_accessor :code, :from_value, :to_value

  def initialize(cod, from_val, to_val)
    self.code = cod
    self.from_value = from_val
    self.to_value = to_val
  end

  def description
    "#{helpers.number_with_delimiter from_value} - #{helpers.number_with_delimiter to_value} miles"
  end

  @@all = [
    Mileage.new(:m1,  1,      10_000),
    Mileage.new(:m2,  10_001, 20_000),
    Mileage.new(:m3,  20_001, 30_000),
    Mileage.new(:m4,  30_001, 40_000),
    Mileage.new(:m5,  40_001, 50_000),
    Mileage.new(:m6,  50_001, 60_000),
    Mileage.new(:m7,  60_001, 70_000),
    Mileage.new(:m8,  70_001, 80_000),
    Mileage.new(:m9,  80_001, 90_000),
    Mileage.new(:m10, 90_001, 100_000),
  ]

  def self.all
    @@all
  end

  def self.all_hash
    Hash[@@all.map{|m| [m.description, m.code]}]
  end

  def self.first_value_of_range(k)
    @@all.select{|m| m.code == k.to_sym}[0].from_value
  end

  def self.last_value_of_range(k)
    @@all.select{|m| m.code == k.to_sym}[0].to_value
  end

  private
  def helpers
    ActionController::Base.helpers
  end
end
