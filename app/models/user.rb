class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: '全角カタカナを使用してください' } do
    validates :first_kana
    validates :last_kana
  end  
  validates :birth_day, presence: true

  has_many :prototypes, dependent: :destroy
  has_many :comments
end
