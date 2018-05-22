FROM ruby:2.4.2

ENV PORT=3001
ENV RAILS_ENV=production

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp

CMD bundle exec rails s -p $PORT -b '0.0.0.0'