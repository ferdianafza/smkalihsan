class Blog < ApplicationRecord
  has_one_attached :banner
  has_rich_text :content
end
