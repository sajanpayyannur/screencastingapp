# == Schema Information
#
# Table name: admin_logos
#
#  id                 :integer          not null, primary key
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Admin::Logo < ActiveRecord::Base
  attr_accessible :image

  validates_attachment_presence :image

  has_attached_file :image,
    :storage => :s3,
    :styles => { :thumb => "265x100!" },
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => 'auctions_banners'
end
