# == Schema Information
#
# Table name: csvfiles
#
#  id               :integer          not null, primary key
#  csv_file_name    :string(255)
#  csv_content_type :string(255)
#  csv_file_size    :integer
#  csv_updated_at   :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Csvfile < ActiveRecord::Base
  attr_accessible :csv

  validates_attachment_presence :csv

  has_attached_file :csv,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => 'csv_files'
end
