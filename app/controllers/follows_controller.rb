#フォロー・フォロワー表示管理コンソール

class FollowsController < ApplicationController
  before_action :user_signed_in?, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  def following
    @menber_id = params['id']
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(5).order("created_at DESC")
    @following_users = User.where(id: User.find(params[:id]).following).order("created_at DESC").page(params[:page]).per(25)

  end

  def followers
    @menber_id = params['id']
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(5).order("created_at DESC")

    @followers_users = User.where(id: User.find(params[:id]).followers).order("created_at DESC").page(params[:page]).per(25)

  end
end
