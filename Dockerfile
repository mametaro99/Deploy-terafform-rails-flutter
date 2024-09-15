# Dockerfile
FROM ruby:3.3.3

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs yarn default-mysql-client

# 作業ディレクトリを設定
WORKDIR /app

# アプリケーションのソースコードをコンテナにコピー
COPY . /app

# Gemfile と Gemfile.lock をコンテナにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Bundler を使って gems をインストール
RUN bundle install


# サーバーを起動
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]