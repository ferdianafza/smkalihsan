class Blog < ApplicationRecord
  paginates_per 5
  has_one_attached :banner
  has_rich_text :content
end
