#https://blog.codeship.com/deploying-docker-rails-app/
#docker run --name hem -p 80:3000 -d hem:0
#docker run -d --name hem -p 80:3000 -e SECRET_KEY_BASE=`rake secret` hem:0
#docker exec rails-server env
FROM ruby

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
#RUN bundle install
RUN bundle install --jobs 20 --retry 5 --without development test

# Set Rails to run in production
ENV HEM_DATABASE_NAME $HEM_DATABASE_NAME
ENV HEM_DATABASE_USER $HEM_DATABASE_USER
ENV HEM_DATABASE_PASSWORD $HEM_DATABASE_PASSWORD
ENV HEM_HOST $HEM_HOST

ENV S3_KEY $S3_KEY
ENV S3_SECRET $S3_SECRET
ENV SECRET_KEY_BASE $SECRET_KEY_BASE

ENV RAILS_ENV production 
ENV RACK_ENV production


COPY . .

# Precompile Rails assets
RUN bundle exec rake assets:precompile
RUN bundle exec rake db:migrate
RUN bundle exec rake db:seed


EXPOSE 3000
CMD ["rails", "s", "Puma", "-b", "0.0.0.0"]

#CMD bundle exec puma -C config/puma.rb