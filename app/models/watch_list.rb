# == Schema Information
#
# Table name: watch_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  auction_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WatchList < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction
  attr_accessible :user_id, :auction_id
  validates_presence_of :auction_id, :user_id
end
