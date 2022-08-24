require "application_system_test_case"

class BidsTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @bid = Bid.ordered.first 
  end
  
  test "Showing a bid" do
    visit bids_path
    click_link @bid.name

    assert_selector "h1", text: @bid.name
  end

  test "Creating a new bid" do
   
    visit bids_path
    assert_selector "h1", text: "Bids"

    click_on "New bid"
    fill_in "Name", with: "Capybara bid"

    assert_selector "h1", text: "Bids"
    click_on "Create bid"

    
    assert_selector "h1", text: "Bids"
    assert_text "Capybara bid"

  end


  test "Updating a bid" do
    visit bids_path
    assert_selector "h1", text: "Bids"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated bid"
    
    assert_selector "h1", text: "Bids"
    click_on "Update bid"

    assert_selector "h1", text: "Bids"
    assert_text "Updated bid"
  end

  test "Destroying a bid" do
    visit bids_path
    assert_text @bid.name

    click_on "Delete", match: :first
    assert_no_text @bid.name
  end
end
