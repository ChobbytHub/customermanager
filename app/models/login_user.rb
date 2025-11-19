class LoginUser < ApplicationRecord
  has_secure_password # password_digest 管理

  # 基本バリデーション
  validates :login, presence: true, uniqueness: true
  validates :name, presence: true

  # 権限は 1,2,3 のみ許可
  validates :lvl, presence: true,
                  numericality: { only_integer: true, greater_than: 0, less_than: 4 }

  # パスワードは最低6文字以上（空欄不可）
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  # 更新時は password が空でも更新可能（変更しない場合）
  validates :password, length: { minimum: 6 }, allow_nil: true, on: :update

  # 権限判定メソッド
  def admin?; lvl == 1; end
  def manager?; lvl == 2; end
  def employee?; lvl == 3; end
end
