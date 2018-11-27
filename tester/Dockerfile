FROM ruby:2.5

ENV APP_HOME /app

RUN apt-get update && apt-get install -y postgresql-client

RUN mkdir -p $APP_HOME
COPY Gemfile* $APP_HOME/

WORKDIR $APP_HOME
RUN bundle install

COPY . $APP_HOME/

CMD ["bundle", "exec", "rspec"]
