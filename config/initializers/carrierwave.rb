CarrierWave.configure do |config|
  	config.fog_credentials = {
	  	:provider              => 'AWS',
	  	:aws_access_key_id     => "AKIAJZBYGLFUN3K3RDDA", #ENV['S3_KEY'],
	  	:aws_secret_access_key => "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", #ENV['S3_SECRET']
	  	:region                => "us-west-1"
	  }

	  config.cache_dir     = "#{Rails.root}/tmp/uploads"
	  config.fog_directory = "pclubassets" #ENV['S3_BUCKET']
end