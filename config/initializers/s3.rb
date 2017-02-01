#CarrierWave.configure do |config|
#  config.fog_credentials = {
#    :provider               => 'AWS',
#    :aws_access_key_id      => ENV['S3_KEY'],
#    :aws_secret_access_key  => ENV['S3_SECRET'],
#    :region                 => ENV['S3_REGION']
#  }
#  config.fog_directory  = ENV['S3_BUCKET_NAME']
#end

# santo
if Rails.env.test? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.root = "#{Rails.root}/tmp"
    config.cache_dir = "#{Rails.root}/tmp/images"
  end
else
  CarrierWave.configure do |config|
    #config.fog_provider = 'fog/aws'  
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET'],
      :region                => ENV['S3_REGION']
    }
    #config.storage = :fog
    #
    config.fog_directory = ENV['S3_BUCKET_NAME']
    #config.asset_host = "#{ENV['AWS_S3_ASSET_URL']}/#{ENV['AWS_S3_BUCKET_NAME']}"
  end
end