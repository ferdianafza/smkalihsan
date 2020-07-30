require "application_system_test_case"

class PendampingLaporansTest < ApplicationSystemTestCase
  setup do
    @pendamping_laporan = pendamping_laporans(:one)
  end

  test "visiting the index" do
    visit pendamping_laporans_url
    assert_selector "h1", text: "Pendamping Laporans"
  end

  test "creating a Pendamping laporan" do
    visit pendamping_laporans_url
    click_on "New Pendamping Laporan"

    fill_in "Name", with: @pendamping_laporan.name
    click_on "Create Pendamping laporan"

    assert_text "Pendamping laporan was successfully created"
    click_on "Back"
  end

  test "updating a Pendamping laporan" do
    visit pendamping_laporans_url
    click_on "Edit", match: :first

    fill_in "Name", with: @pendamping_laporan.name
    click_on "Update Pendamping laporan"

    assert_text "Pendamping laporan was successfully updated"
    click_on "Back"
  end

  test "destroying a Pendamping laporan" do
    visit pendamping_laporans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pendamping laporan was successfully destroyed"
  end
end
