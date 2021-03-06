class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 1, maximum: 300 }

  belongs_to :user
  belongs_to :post
end
