# == Schema Information
#
# Table name: admin_links
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin::Link < ActiveRecord::Base
  attr_accessible :text, :url
end
