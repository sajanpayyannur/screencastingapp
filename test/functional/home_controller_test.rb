require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "redirect to payment page when user is signed in" do
    sign_in FactoryGirl.create(:user)

    get :index
    assert_redirected_to new_setup_fee_payment_payments_url
  end

  test "dont redirect to payment page if user is admin" do
    sign_in FactoryGirl.create(:user, :admin)

    get :index
    assert_response :success
  end
end
