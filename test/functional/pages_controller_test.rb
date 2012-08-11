require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: FactoryGirl.create(:page).id
    assert_response :success
  end
end
