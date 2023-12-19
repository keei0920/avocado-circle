class Question < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :solution, presence: true
  validates :text, presence: true
end
