class Note < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :theme
  belongs_to :who

  belongs_to :user 
  has_many   :comments
  has_many   :likes
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :theme_id
    validates :who_id
  end
end
