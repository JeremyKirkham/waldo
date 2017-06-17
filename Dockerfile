FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /waldo
WORKDIR /waldo
ADD Gemfile /waldo/Gemfile
ADD Gemfile.lock /waldo/Gemfile.lock
RUN bundle install
ADD . /waldo
