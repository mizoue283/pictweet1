Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index' #ルートパス時のツイート一覧
  get 'tweets' => 'tweets#index' #ツイート一覧
  get 'tweets/new' => 'tweets#new' #ツイート投稿画面
  post  'tweets'      =>  'tweets#create' #ツイート投稿機能
  get   'users/:id'   =>  'users#show'    #Mypage,個々のページへのルーティング
  delete  'tweets/:id'  => 'tweets#destroy'#ツイート削除

  get 'tweets/:id' => 'comments#show'       #ツイート詳細画面
  get 'users/:id/following' => 'follows#following'
  get 'users/:id/followers' => 'follows#followers'
  get 'mypage/:id' => 'mypage#changeID'#登録情報変更
  post 'mypage/mypage/:id' => 'mypage#changedID'#登録情報変更済み
  #コメント
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]

  #フォロー
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy] #Relationshipリソース用のルーティングを追加

end