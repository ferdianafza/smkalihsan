require 'test_helper'

class PendampingLaporansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pendamping_laporan = pendamping_laporans(:one)
  end

  test "should get index" do
    get pendamping_laporans_url
    assert_response :success
  end

  test "should get new" do
    get new_pendamping_laporan_url
    assert_response :success
  end

  test "should create pendamping_laporan" do
    assert_difference('PendampingLaporan.count') do
      post pendamping_laporans_url, params: { pendamping_laporan: { name: @pendamping_laporan.name } }
    end

    assert_redirected_to pendamping_laporan_url(PendampingLaporan.last)
  end

  test "should show pendamping_laporan" do
    get pendamping_laporan_url(@pendamping_laporan)
    assert_response :success
  end

  test "should get edit" do
    get edit_pendamping_laporan_url(@pendamping_laporan)
    assert_response :success
  end

  test "should update pendamping_laporan" do
    patch pendamping_laporan_url(@pendamping_laporan), params: { pendamping_laporan: { name: @pendamping_laporan.name } }
    assert_redirected_to pendamping_laporan_url(@pendamping_laporan)
  end

  test "should destroy pendamping_laporan" do
    assert_difference('PendampingLaporan.count', -1) do
      delete pendamping_laporan_url(@pendamping_laporan)
    end

    assert_redirected_to pendamping_laporans_url
  end
end
