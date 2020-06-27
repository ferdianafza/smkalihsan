class Artikel < ApplicationRecord
  has_one_attached :thumbnail
  has_rich_text :content
end
