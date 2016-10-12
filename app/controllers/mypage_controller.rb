class MypageController < ApplicationController


  before_action :mypage_only_one,   except: :users
  def changeID
    @myID = params['id']


    @change_nickname = User.find(params['id']).nickname
    @change_introduction = User.find(params['id']).introduction


  end

  def changedID
    @user = User.find(current_user.id)
    @user.nickname = mypage_params[:nickname]
    @user.introduction = mypage_params[:text]
    @user.save

  end

  def mypage_only_one
    redirect_to action: :users unless user_signed_in? && current_user.id.to_i != params['id']

  end



  private
  def mypage_params
    params.permit(:nickname, :text)
  end
end


