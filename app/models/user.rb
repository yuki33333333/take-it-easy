class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "メールアドレスを入力してください。"}
  validates :password, presence: true
  validates :password, confirmation: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i, message: "８−32字で入力し、英字と数字をそれぞれ１文字以上使ってください。"}
  
  has_secure_password
end
