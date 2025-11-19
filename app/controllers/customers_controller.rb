class CustomersController < ApplicationController
  before_action :require_login
  before_action :check_access, only: %i[new create edit update destroy]
  before_action :set_customer, only: %i[show edit update destroy]

  # 権限チェック
  def check_access
    unless admin? || customer_manager?
      redirect_to customers_path, alert: "権限がありません"
    end
  end

  # 一覧（検索対応）
  def index
    @customers = if params[:name].present?
                   Customer.where("name ILIKE ?", "%#{params[:name]}%")
                 else
                   Customer.all
                 end
  end

  # 詳細
  def show
  end

  # 新規登録フォーム
  def new
    @customer = Customer.new
  end

  # 新規登録
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: '顧客を登録しました。'
    else
      flash.now[:alert] = '登録に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  # 編集フォーム
  def edit
  end

  # 更新
  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: '顧客情報を更新しました。'
    else
      flash.now[:alert] = '更新に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除確認画面
  def delete_confirm
  end

  # 削除
  def destroy
    if @customer.destroy
      redirect_to customers_path, notice: '顧客を削除しました。'
    else
      redirect_to customers_path, alert: '削除に失敗しました。'
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :zip, :address1, :address2, :tel, :fax, :email)
  end
end
