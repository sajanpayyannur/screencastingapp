# == Schema Information
#
# Table name: admin_menu_entries
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  order         :integer
#  admin_page_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Admin::MenuEntry < ActiveRecord::Base
  belongs_to :admin_page, :class_name => "Admin::Page"
  attr_accessible :admin_page_id, :order, :title
  validates_presence_of :title
end
