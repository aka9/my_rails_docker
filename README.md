# my_rails_docker
my rails docker on postgresql.

## Discription
自分用のrails dockerです. databaseはpostgresqlを使っています.

参考サイト
- https://docs.docker.com/compose/rails/
- http://qiita.com/kawasin73/items/2253523be18e5afd994f

同フォルダの「.env」を変えれば色々変えれます.

## Installation

このコードを実行すると, railsを立ち上げるdockerが動きます.

```bash
git clone e155753/my_rails_docker
cd my_rails_docker
sh my-ruby-docker-init.sh
docker-compose up
```

また, 同階層に「myapp」というフォルダができ, そこの中にrailsに関係するファイルがあります.

```bash
% ls ./myapp
./            Gemfile       app/          db/           public/
../           Gemfile.lock  bin/          lib/          test/
.git/         README.md     config/       log/          tmp/
.gitignore    Rakefile      config.ru     package.json  vendor/
```

この作成するフォルダは「.env」ファイルに依存しているので, 「myapp」が嫌なら他のフォルダに書き換えて下さい.

```bash
% cat .env
APP_HOME="/myapp" # ここの名前を変える.
DATABASE="postgresql"
RAILS_DATABASE_USER="postgres"
RAILS_DATABASE_PASSWORD="password"
```

動かなくても責任は持ちません.

## Author
e155753

## License
Mit License