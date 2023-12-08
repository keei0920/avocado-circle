class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  
  def was_attached?
    image.attached?
  end

  validates :text, presence: true, unless: :was_attached?
  validates :date, presence: true

  validates :condition_id, numericality: { other_than: 1, message: 'を選択してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
end
