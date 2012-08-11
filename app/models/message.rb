# == Schema Information
#
# Table name: messages
#
#  id               :integer          not null, primary key
#  to               :string(255)
#  from             :string(255)
#  subject          :string(255)
#  body             :text
#  messageable_id   :integer
#  messageable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Message < ActiveRecord::Base
  belongs_to :messageable, :polymorphic => true
  attr_accessible :body, :from, :messageable_id, :messageable_type, :subject, :to
end
