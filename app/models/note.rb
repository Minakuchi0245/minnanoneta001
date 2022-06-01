class Note < ApplicationRecord
  belongs_to :user 
  has_many   :comments
  has_many   :likes

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :theme_id
    validates :who_id
  end
end
