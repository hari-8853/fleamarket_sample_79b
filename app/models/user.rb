class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         include JpPrefecture

  has_one :credit_card, dependent: :destroy
  
  jp_prefecture :prefecture_code
  
  def prefecture_name(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  validates :nickname, presence: true
  validates :first_name, presence: true, format: {
    with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
    message: "は、全角で入力して下さい"
    }
  validates :family_name, presence: true, format: {
    with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
    message: "は、全角で入力して下さい"
    }
  validates :first_name_kana, presence: true, format: {
    with: /\A[ぁ-んァ-ヶー－]+\z/,
    message: "は、全角カナで入力して下さい"
   }
  validates :family_name_kana, presence: true, format: {
    with: /\A[ぁ-んァ-ヶー－]+\z/,
    message: "は、全角カナで入力して下さい"
    }
  validates :birth_date, presence: true
  validates :post_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, uniqueness: true

end


