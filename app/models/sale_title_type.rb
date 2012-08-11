# == Schema Information
#
# Table name: sale_title_types
#
#  id          :integer          not null, primary key
#  state_id    :integer
#  code        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SaleTitleType < ActiveRecord::Base
  belongs_to :state
  attr_accessible :code, :description, :state_id
  has_and_belongs_to_many :advanced_searches

  def to_s
    "#{state.try :acronym} - #{description}"
  end
end
