class CreateArtikels < ActiveRecord::Migration[6.0]
  def change
    create_table :artikels do |t|
      t.string :judul
      t.string :konten

      t.timestamps
    end
  end
end
