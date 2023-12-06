class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :purpose
  has_one    :avocado
  has_many   :posts
  has_many   :questions
  has_many   :answers

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 10 }

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :purpose_id
    validates :prefecture_id
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
