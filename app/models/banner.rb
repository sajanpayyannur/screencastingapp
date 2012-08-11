# == Schema Information
#
# Table name: banners
#
#  id                  :integer          not null, primary key
#  banner_file_name    :string(255)
#  banner_content_type :string(255)
#  banner_file_size    :integer
#  banner_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  link                :string(255)
#  position            :string(255)
#

class Banner < ActiveRecord::Base
  POSITIONS = ['header', 'under-menu']

  attr_accessible :banner, :link, :position

  has_attached_file :banner,
    :storage => :s3,
    :styles => lambda { |banner| { :medium => 
      if banner.instance.top?
        "650x80!"
      else 
        "940x80!"
      end 
    }},
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => 'auctions_banners'

  def top?
    self.position == 'header'
  end
  
  def self.header
    where(position: 'header').order('updated_at DESC').first
  end

  def self.under_menu
    where(position: 'under-menu').order('updated_at DESC').first
  end
  
  def header_dimensions
    "650x80!"
  end

  def under_menu_dimensions
    "940x80!"
  end
end
