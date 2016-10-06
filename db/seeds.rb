# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#サンプルヨーザーの作成
User.create!(nickname:  "Example User",
             email: "example@me.com",
             password:              "foobar",
             password_confirmation: "foobar",
             introduction:"私の名前は練です　よろしくね。趣味はジャズでトランペットをしてるよ",
             current_sign_in_ip: Time.zone.now)


99.times do |n|
  string = "example-#{n+1}"
  name  = string
  email = "example-#{n+1}@me.com"
  password = "password"
  User.create!(nickname: name,
               email: email,
               password:              password,
               password_confirmation: password,
               introduction:"私の名前は#{name}です　よろしくね。趣味はジャズでトランペットをしてるよ",
               current_sign_in_ip: Time.zone.now)
  Tweet.create!(text: "今日も疲れました",
                user_id:"#{n+1}"


  )
end




#ランダムに作る
# リレーションシップ
users = User.all
user  = users.first
following = users[10..50]
followers = users[10..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }