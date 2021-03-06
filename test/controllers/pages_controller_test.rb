require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "front page does not crash :)" do
    get :landing
    assert_response :success
  end

  test "demo page" do
    get :demo
    assert_response :success
    assert_select '.panel-body', /active/
    assert_select '.panel-body', /abcdefgh/
    assert_select '.panel-body', /12\.34\.56\.78/
    assert_select '.panel-title', 'Send Command to Server'
  end

  test "basically static pages" do
    get :about
    assert_response :success
    get :info
    assert_response :success
    get :tos
    assert_response :success
    get :digital_ocean_setup
    assert_response :success
    get :not_found
    assert_response 404
    get :unacceptable
    assert_response 422
    get :internal_error
    assert_response 500
  end

end
