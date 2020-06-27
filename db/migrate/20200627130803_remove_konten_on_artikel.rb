class RemoveKontenOnArtikel < ActiveRecord::Migration[6.0]
  def change
    remove_column :artikels, :konten
  end
end
