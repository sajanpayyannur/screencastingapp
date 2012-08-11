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

require 'test_helper'

class CsvfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
