class RelationshipsController < ApplicationController

  #フォローボタンの実装

  #フォローする ＝＞新しいリレーションシップを作成する
  #フォローを解除する　＝＞リレーションシップを削除する
  #Relationshipsコントローラのcreate,destroyアクションの実装を行う。


  before_action :user_signed_in? #ここ注意　　サインインした後

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end