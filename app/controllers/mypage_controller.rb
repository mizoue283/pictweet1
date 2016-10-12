class MypageController < ApplicationController


  before_action :mypage_only_one,   only: [:changeID, :changedID, :mypage_params]
      def changeID
    @myID = current_user.id.to_i


    @change_nickname = User.find(current_user.id.to_i).nickname
    @change_introduction = User.find(current_user.id.to_i).introduction


  end

  def changedID
    @user = User.find(current_user.id)
    @user.nickname = mypage_params[:nickname]
    @user.introduction = mypage_params[:text]
    @user.save

  end

  def mypage_only_one
    redirect_to action: :error unless user_signed_in?

  end

  def error


  end

  private
  def mypage_params
    params.permit(:nickname, :text)
  end
end


