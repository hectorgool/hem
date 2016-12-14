#docker build -t hem:0 --build-arg S3_BUCKET_NAME=$S3_BUCKET_NAME --build-arg S3_REGION=$S3_REGION --build-arg S3_KEY=$S3_KEY --build-arg S3_SECRET=$S3_SECRET --build-arg SECRET_KEY_BASE=$SECRET_KEY_BASE .
#docker run --name hem -p 80:3000 -d -e RDS_DB_NAME=$RDS_DB_NAME -e RDS_USERNAME=$RDS_USERNAME -e RDS_PASSWORD=$RDS_PASSWORD -e RDS_HOSTNAME=$RDS_HOSTNAME -e RDS_PORT=$RDS_PORT --restart=always hem:0
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

ARG S3_BUCKET_NAME
ENV S3_BUCKET_NAME $S3_BUCKET_NAME 

ARG S3_KEY
ENV S3_KEY $S3_KEY 

ARG S3_SECRET
ENV S3_SECRET $S3_SECRET 

ARG S3_REGION
ENV S3_REGION $S3_REGION 

ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE $SECRET_KEY_BASE 

ENV RAILS_ENV production 
ENV RACK_ENV production

COPY . .

# Precompile Rails assets
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["rails", "s", "Puma", "-b", "0.0.0.0"]
