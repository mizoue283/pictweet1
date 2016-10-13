class Comment < ActiveRecord::Base
  belongs_to :tweet               #tweetsテーブルとのアソシエーション
  belongs_to :user                #usersテーブルとのアソシエーション
end
