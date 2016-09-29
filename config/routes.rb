Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index' #ルートパス時のツイート一覧
  get 'tweets' => 'tweets#index' #ツイート一覧
  get 'tweets/new' => 'tweets#new' #ツイート投稿画面
  post  'tweets'      =>  'tweets#create' #ツイート投稿機能
  get   'users/:id'   =>  'users#show'    #Mypage,個々のページへのルーティング
end