class Post < ApplicationRecord

  validates :title, presence: true,
                length: { minimum: 4, maximum: 20 }

  validates :body, presence: true,
                length: { maximum: 1000 }

  has_many :comments, dependent: :destroy
  belongs_to :user

end
