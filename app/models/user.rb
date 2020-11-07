class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :email, uniqueness: true, format: {with: /@.+/, allow_blank: true}
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "include both letters and numbers"}
  with_options presence: true do
    validates :nickname
    validates :birthday
    
    with_options format: {with: NAME_REGEX, message: "Full-width characters"} do
      validates :firstname
      validates :lastname
    end

    with_options format: {with: NAMEKANA_REGEX, message: "Full-width katakana characters"} do
      validates :firstname_kana
      validates :lastname_kana
    end
  end
end
