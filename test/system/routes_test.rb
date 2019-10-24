require "application_system_test_case"

class RoutesTest < ApplicationSystemTestCase
  setup do
    @route = routes(:one)
  end

  test "visiting the index" do
    visit routes_url
    assert_selector "h1", text: "Routes"
  end

  test "creating a Route" do
    visit routes_url
    click_on "New Route"

    fill_in "Bording point", with: @route.bording_point
    fill_in "Destination", with: @route.destination
    fill_in "Dropping point", with: @route.dropping_point
    fill_in "Duration", with: @route.duration
    fill_in "Origin", with: @route.origin
    fill_in "Service name", with: @route.service_name
    fill_in "Service num", with: @route.service_num
    fill_in "Total seats", with: @route.total_seats
    click_on "Create Route"

    assert_text "Route was successfully created"
    click_on "Back"
  end

  test "updating a Route" do
    visit routes_url
    click_on "Edit", match: :first

    fill_in "Bording point", with: @route.bording_point
    fill_in "Destination", with: @route.destination
    fill_in "Dropping point", with: @route.dropping_point
    fill_in "Duration", with: @route.duration
    fill_in "Origin", with: @route.origin
    fill_in "Service name", with: @route.service_name
    fill_in "Service num", with: @route.service_num
    fill_in "Total seats", with: @route.total_seats
    click_on "Update Route"

    assert_text "Route was successfully updated"
    click_on "Back"
  end

  test "destroying a Route" do
    visit routes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Route was successfully destroyed"
  end
end
