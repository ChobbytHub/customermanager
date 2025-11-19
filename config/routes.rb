Rails.application.routes.draw do
  get "menu/index"
  get "passwords/edit"
  get "passwords/update"
  get "menu", to: "menu#index"
  # ログイン・セッション
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # パスワード変更
  get  'password/edit', to: 'passwords#edit',   as: :edit_password
  patch 'password',     to: 'passwords#update', as: :update_password

  # ユーザー管理
  resources :login_users do
    member do
      get :delete_confirm # 削除確認画面
    end
  end

  # 顧客管理
  resources :customers do
    collection do
      get :search  # 検索画面
    end
    member do
      get :confirm       # 新規登録/編集確認画面
      get :delete_confirm # 削除確認画面
    end
  end

  # ルート
  root 'sessions#new'
end
