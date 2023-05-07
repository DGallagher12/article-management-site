FROM ruby:3.0.0

RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs

COPY . /Users/college/rails-projects/CADProject/article-management-site
ARG SECRET_KEY_BASE

WORKDIR /Users/college/rails-projects/CADProject/article-management-site

ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

RUN gem install bundler:2.2.3
RUN bundle install
RUN rake db:migrate
RUN rails test
RUN rails assets:precompile
CMD [ "rails", "server"]