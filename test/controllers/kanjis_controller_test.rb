require "test_helper"

class KanjisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kanji = kanjis(:one)
  end

  test "should get index" do
    get kanjis_url
    assert_response :success
  end

  test "should get new" do
    get new_kanji_url
    assert_response :success
  end

  test "should create kanji" do
    assert_difference("Kanji.count") do
      post kanjis_url, params: { kanji: { frame_number: @kanji.frame_number, kanji: @kanji.kanji, radicals: @kanji.radicals, rank: @kanji.rank } }
    end

    assert_redirected_to kanji_url(Kanji.last)
  end

  test "should show kanji" do
    get kanji_url(@kanji)
    assert_response :success
  end

  test "should get edit" do
    get edit_kanji_url(@kanji)
    assert_response :success
  end

  test "should update kanji" do
    patch kanji_url(@kanji), params: { kanji: { frame_number: @kanji.frame_number, kanji: @kanji.kanji, radicals: @kanji.radicals, rank: @kanji.rank } }
    assert_redirected_to kanji_url(@kanji)
  end

  test "should destroy kanji" do
    assert_difference("Kanji.count", -1) do
      delete kanji_url(@kanji)
    end

    assert_redirected_to kanjis_url
  end
end
