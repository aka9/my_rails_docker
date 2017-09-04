#!/bin/sh

# .envの変数を取得
source .env

# 最初の文字に/を入れない状態で, ディレクトリを作成
# 例 /myapp -> ./myapp
#       myapp -> ./myapp
mkdir -p ./${APP_HOME#/}

# Gemfileを作成
echo "source 'https://rubygems.org'" > ./${APP_HOME#/}/Gemfile
echo "gem 'rails'" >> ./${APP_HOME#/}/Gemfile
echo "gem 'pg'" >> ./${APP_HOME#/}/Gemfile

# Gemfile.lockを作成
touch ./${APP_HOME#/}/Gemfile.lock

# dockerをbuild
docker-compose build

# railsプロジェクトの作成 
docker-compose run --rm web rails new . --force --database=${DATABASE} 

docker-compose run --rm web bundle install
# database.ymlをプロジェクトのものに差し替え
cp -f database.yml ./${APP_HOME#/}/config/database.yml

# databaseの作成
docker-compose run --rm web rake db:create

