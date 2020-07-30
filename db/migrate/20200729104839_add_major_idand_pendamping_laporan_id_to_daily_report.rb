class AddMajorIdandPendampingLaporanIdToDailyReport < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_reports, :major_id, :integer
    add_column :daily_reports, :pendamping_laporan_id, :integer
  end
end
