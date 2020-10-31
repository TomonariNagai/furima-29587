class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: {message: "can't be blank"}
  validates :email, uniqueness: true, format: {with: /@.+/, allow_blank: true}
  validates :password, length: {minimum: 6 }, confirmation: {message: "confirmation doesn't match Password"}, format: {with: /\A[a-zA-Z0-9]+\z/, message: "include both letters and numbers"}
  validates :firstname, presence: {message: "can't be blank"}, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :lastname, presence: {message: "can't be blank"}, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  validates :firstname_kana, presence: {message: "can't be blank"}, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters"}
  validates :lastname_kana, presence: {message: "can't be blank"}, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters"}
  validates :birthday, presence: {message: "can't be blank"}

end
