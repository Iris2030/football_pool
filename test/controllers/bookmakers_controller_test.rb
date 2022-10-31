require "test_helper"

class BookmakersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmaker = bookmakers(:one)
  end

  test "should get index" do
    get bookmakers_url
    assert_response :success
  end

  test "should get new" do
    get new_bookmaker_url
    assert_response :success
  end

  test "should create bookmaker" do
    assert_difference("Bookmaker.count") do
      post bookmakers_url, params: { bookmaker: {  } }
    end

    assert_redirected_to bookmaker_url(Bookmaker.last)
  end

  test "should show bookmaker" do
    get bookmaker_url(@bookmaker)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookmaker_url(@bookmaker)
    assert_response :success
  end

  test "should update bookmaker" do
    patch bookmaker_url(@bookmaker), params: { bookmaker: {  } }
    assert_redirected_to bookmaker_url(@bookmaker)
  end

  test "should destroy bookmaker" do
    assert_difference("Bookmaker.count", -1) do
      delete bookmaker_url(@bookmaker)
    end

    assert_redirected_to bookmakers_url
  end
end
