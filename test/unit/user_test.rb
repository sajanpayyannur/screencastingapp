# encoding: utf-8
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nickname               :string(255)
#  name                   :string(255)
#  description            :text
#  admin                  :boolean
#  phone_number           :string(255)
#  address                :string(255)
#  city                   :string(255)
#  zip                    :string(255)
#  state_id               :integer
#


require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create proper slug" do
    user = FactoryGirl.create(:user, nickname: 'JoãoPessoa')
    assert_equal 'joaopessoa', user.nickname

    user = FactoryGirl.create(:user, nickname: 'maria rita', email: 'maria@mail.com')
    assert_equal 'maria-rita', user.nickname
  end
end
