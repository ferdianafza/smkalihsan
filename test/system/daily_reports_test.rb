require "application_system_test_case"

class DailyReportsTest < ApplicationSystemTestCase
  setup do
    @daily_report = daily_reports(:one)
  end

  test "visiting the index" do
    visit daily_reports_url
    assert_selector "h1", text: "Daily Reports"
  end

  test "creating a Daily report" do
    visit daily_reports_url
    click_on "New Daily Report"

    fill_in "Dhuha", with: @daily_report.dhuha
    fill_in "Keterangan", with: @daily_report.keterangan
    fill_in "Subuh", with: @daily_report.subuh
    fill_in "Tadarus", with: @daily_report.tadarus
    click_on "Create Daily report"

    assert_text "Daily report was successfully created"
    click_on "Back"
  end

  test "updating a Daily report" do
    visit daily_reports_url
    click_on "Edit", match: :first

    fill_in "Dhuha", with: @daily_report.dhuha
    fill_in "Keterangan", with: @daily_report.keterangan
    fill_in "Subuh", with: @daily_report.subuh
    fill_in "Tadarus", with: @daily_report.tadarus
    click_on "Update Daily report"

    assert_text "Daily report was successfully updated"
    click_on "Back"
  end

  test "destroying a Daily report" do
    visit daily_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily report was successfully destroyed"
  end
end
