class CreateDailyReports < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_reports do |t|
      t.string :subuh
      t.string :dhuha
      t.string :tadarus
      t.string :keterangan

      t.timestamps
    end
  end
end
