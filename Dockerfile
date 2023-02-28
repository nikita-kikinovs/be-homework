FROM ruby:3.1.2-alpine

RUN apk add --update --virtual runtime-dependencies \
  build-base \
  git \
  sqlite-dev \
  gcompat \
  tzdata \
  && rm -rf /var/cache/apk/*

EXPOSE 3000

WORKDIR /app

RUN gem install rails bundler
