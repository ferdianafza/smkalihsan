class AddUserIdToDailyreport < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_reports, :user_id, :integer
  end
end
