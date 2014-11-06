require 'test_helper'

class SiteDetailsControllerTest < ActionController::TestCase
  setup do
    @site_detail = site_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_detail" do
    assert_difference('SiteDetail.count') do
      post :create, site_detail: { address: @site_detail.address, facebook: @site_detail.facebook, google_analytics: @site_detail.google_analytics, google_plus: @site_detail.google_plus, linkedin: @site_detail.linkedin, organization: @site_detail.organization, skype: @site_detail.skype, telephone: @site_detail.telephone, title: @site_detail.title, twitter: @site_detail.twitter }
    end

    assert_redirected_to site_detail_path(assigns(:site_detail))
  end

  test "should show site_detail" do
    get :show, id: @site_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_detail
    assert_response :success
  end

  test "should update site_detail" do
    patch :update, id: @site_detail, site_detail: { address: @site_detail.address, facebook: @site_detail.facebook, google_analytics: @site_detail.google_analytics, google_plus: @site_detail.google_plus, linkedin: @site_detail.linkedin, organization: @site_detail.organization, skype: @site_detail.skype, telephone: @site_detail.telephone, title: @site_detail.title, twitter: @site_detail.twitter }
    assert_redirected_to site_detail_path(assigns(:site_detail))
  end

  test "should destroy site_detail" do
    assert_difference('SiteDetail.count', -1) do
      delete :destroy, id: @site_detail
    end

    assert_redirected_to site_details_path
  end
end
