class Customer < ApplicationRecord
  # 基本情報
  validates :name, presence: true

  # optional: email形式や電話番号形式チェック
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end
