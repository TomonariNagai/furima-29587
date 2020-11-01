class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true, format: {with: /@.+/, allow_blank: true}
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "include both letters and numbers"}
  validates :firstname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :lastname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :firstname_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters"}
  validates :lastname_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters"}
  validates :birthday, presence: true
end
