class Artikel < ApplicationRecord
  paginates_per 5
  has_one_attached :thumbnail
  has_rich_text :isi
end
