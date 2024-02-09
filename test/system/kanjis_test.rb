require "application_system_test_case"

class KanjisTest < ApplicationSystemTestCase
  setup do
    @kanji = kanjis(:one)
  end

  test "visiting the index" do
    visit kanjis_url
    assert_selector "h1", text: "Kanjis"
  end

  test "should create kanji" do
    visit kanjis_url
    click_on "New kanji"

    fill_in "Frame number", with: @kanji.frame_number
    fill_in "Kanji", with: @kanji.kanji
    fill_in "Radicals", with: @kanji.radicals
    fill_in "Rank", with: @kanji.rank
    click_on "Create Kanji"

    assert_text "Kanji was successfully created"
    click_on "Back"
  end

  test "should update Kanji" do
    visit kanji_url(@kanji)
    click_on "Edit this kanji", match: :first

    fill_in "Frame number", with: @kanji.frame_number
    fill_in "Kanji", with: @kanji.kanji
    fill_in "Radicals", with: @kanji.radicals
    fill_in "Rank", with: @kanji.rank
    click_on "Update Kanji"

    assert_text "Kanji was successfully updated"
    click_on "Back"
  end

  test "should destroy Kanji" do
    visit kanji_url(@kanji)
    click_on "Destroy this kanji", match: :first

    assert_text "Kanji was successfully destroyed"
  end
end
