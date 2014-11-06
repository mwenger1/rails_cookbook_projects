require 'test_helper'
 
class RecipeFlowsTest < ActionDispatch::IntegrationTest
  fixtures :recipes
 
  test "create recipes" do
    https!
    curry = login(:curry)
    get "/recipes/new"
    assert_response :success
 
    post_via_redirect "/recipes/new", title: recipes(:curry).title
    assert_equal '/recipes', path
    assert_equal 'Create Recipe', flash[:notice]
 
    https!(false)
    get "/recipes"
    assert_response :success
    assert assigns(:recipes)
  end
end
