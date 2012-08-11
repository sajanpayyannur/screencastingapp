# == Schema Information
#
# Table name: slider_items
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  image      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SliderItem < ActiveRecord::Base
  attr_accessible :content, :image, :title, :url
end
