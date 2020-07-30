class AddTanggalToDailyReports < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_reports, :tanggal, :date
  end
end
