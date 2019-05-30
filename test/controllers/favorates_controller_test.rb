require 'test_helper'

class FavoratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorate = favorates(:one)
  end

  test "should get index" do
    get favorates_url
    assert_response :success
  end

  test "should get new" do
    get new_favorate_url
    assert_response :success
  end

  test "should create favorate" do
    assert_difference('Favorate.count') do
      post favorates_url, params: { favorate: { imdbID: @favorate.imdbID } }
    end

    assert_redirected_to favorate_url(Favorate.last)
  end

  test "should show favorate" do
    get favorate_url(@favorate)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorate_url(@favorate)
    assert_response :success
  end

  test "should update favorate" do
    patch favorate_url(@favorate), params: { favorate: { imdbID: @favorate.imdbID } }
    assert_redirected_to favorate_url(@favorate)
  end

  test "should destroy favorate" do
    assert_difference('Favorate.count', -1) do
      delete favorate_url(@favorate)
    end

    assert_redirected_to favorates_url
  end
end
