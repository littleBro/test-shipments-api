FROM ruby:2.5

ENV APP_HOME /app

RUN mkdir -p $APP_HOME
COPY Gemfile* $APP_HOME/

WORKDIR $APP_HOME
RUN bundle install

COPY . $APP_HOME/

EXPOSE 3000
