require 'test_helper'

class Admin::MenuEntriesControllerTest < ActionController::TestCase
  setup do
    sign_in FactoryGirl.create(:user, :admin)
    @admin_menu_entry = FactoryGirl.create(:admin_menu_entry)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_menu_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_menu_entry" do
    assert_difference('Admin::MenuEntry.count') do
      post :create, admin_menu_entry: { title: @admin_menu_entry.title, admin_page_id: @admin_menu_entry.admin_page_id, order: @admin_menu_entry.order }
    end

    assert_redirected_to admin_menu_entry_path(assigns(:admin_menu_entry))
  end

  test "should show admin_menu_entry" do
    get :show, id: @admin_menu_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_menu_entry
    assert_response :success
  end

  test "should update admin_menu_entry" do
    put :update, id: @admin_menu_entry, admin_menu_entry: { admin_page_id: @admin_menu_entry.admin_page_id, order: @admin_menu_entry.order }
    assert_redirected_to admin_menu_entry_path(assigns(:admin_menu_entry))
  end

  test "should destroy admin_menu_entry" do
    assert_difference('Admin::MenuEntry.count', -1) do
      delete :destroy, id: @admin_menu_entry
    end

    assert_redirected_to admin_menu_entries_path
  end
end
