require "application_system_test_case"

class JoboffersTest < ApplicationSystemTestCase
  setup do
    @joboffer = joboffers(:one)
  end

  test "visiting the index" do
    visit joboffers_url
    assert_selector "h1", text: "Joboffers"
  end

  test "should create joboffer" do
    visit joboffers_url
    click_on "New joboffer"

    fill_in "Description", with: @joboffer.description
    fill_in "Title", with: @joboffer.title
    click_on "Create Joboffer"

    assert_text "Joboffer was successfully created"
    click_on "Back"
  end

  test "should update Joboffer" do
    visit joboffer_url(@joboffer)
    click_on "Edit this joboffer", match: :first

    fill_in "Description", with: @joboffer.description
    fill_in "Title", with: @joboffer.title
    click_on "Update Joboffer"

    assert_text "Joboffer was successfully updated"
    click_on "Back"
  end

  test "should destroy Joboffer" do
    visit joboffer_url(@joboffer)
    click_on "Destroy this joboffer", match: :first

    assert_text "Joboffer was successfully destroyed"
  end
end
