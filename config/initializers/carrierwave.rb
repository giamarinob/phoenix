CarrierWave.configure do |config|

	YAML.load_file("#{Rails.root.to_s}/config/application.yml").each do |key, value|
    ENV[key.to_s] = value
  end if !Rails.env.production?
	
	config.fog_credentials = {
  	:provider              => 'AWS',
  	:aws_access_key_id     => ENV['S3_KEY'],
  	:aws_secret_access_key => ENV['S3_SECRET'],
  	:region                => "us-west-1"
  }

  config.cache_dir     = "#{Rails.root}/tmp/uploads"
  config.fog_directory = ENV['S3_BUCKET']
end