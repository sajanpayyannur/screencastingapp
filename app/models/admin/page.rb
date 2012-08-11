# == Schema Information
#
# Table name: admin_pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  publish    :boolean
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin::Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :publish, :text, :title

  validates :title, :text, presence: true

  # Tell friendly_id to genenate slug when creating only
  def should_generate_new_friendly_id?
    new_record?
  end

  # Help avoid showing destroy buttons for these slugs
  def protected_slug?
    ['home-page-block', 'footer', 'sidebar', 'between-slide-6-list'].include? self.slug
  end
end
