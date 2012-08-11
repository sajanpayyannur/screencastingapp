require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    sign_in FactoryGirl.create(:user)
  end

  test "load credit card form view" do
    get :new_setup_fee_payment
    assert_response :success
  end
end
