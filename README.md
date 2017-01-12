bundle exec rake db:reset
bundle exec rake db:migrate
bundle exec rake db:seed

echo $S3_BUCKET_NAME
echo $S3_REGION
echo $S3_KEY
echo $S3_SECRET
echo $SECRET_KEY_BASE

echo $RDS_DB_NAME 
echo $RDS_USERNAME
echo $RDS_PASSWORD
echo $RDS_HOSTNAME
echo $RDS_PORT

cat databases_hem.sql | docker exec -i postgres psql -U postgres