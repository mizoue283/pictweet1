# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '52.198.185.199', user: 'Tomoyuki_Yamada', roles: %w{app db web} 

#デプロイするサーバにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/key_pair_key_rsa' 