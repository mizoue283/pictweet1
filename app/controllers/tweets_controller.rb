class TweetsController < ApplicationController



  before_action :move_to_index, except: :index

  def index
    #全体のタイムラインを表示
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(10)

    #自身がフォローしている人だけのタイムラインの表示
    if user_signed_in?
      @tweet_login = Tweet.where(user_id: current_user.following + current_user_id).order("created_at DESC").page(params[:page]).per(10)
    end
    #allあってもなくても良い
    #ASC(昇順)とDESC(降順)
  end

  def new

  end
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end
  def create
    #外部からアクセスさせないように"tweet_params"をprivateで囲っている
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    #これはbinding.pryを使ったデバックを表示
    #binding.pry


    #元々はこれ
    #Tweet.create(name: params[:name], image: params[:image], text: params[:text])
    #ビューでフォームに入力された情報は、コントローラーにキーと一緒にパラメーターとして送られます。
    #このパラメーターはparamsというメソッドを使うことで取得することが出来ます。
    #paramsメソッドを使用する際にはparams[:キー名]という形で使用することが出来ます。
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  private
  def tweet_params
    params.permit(:image, :text)
  end




  def move_to_index
    redirect_to action: :index unless user_signed_in?


  end
end

#自分で作ったAPPの中に入れる