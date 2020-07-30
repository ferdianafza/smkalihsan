class AddFirstnameLastnameMajorIdPendampingLaporanIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :major_id, :integer
    add_column :users, :pendamping_laporan_id, :integer
  end
end
