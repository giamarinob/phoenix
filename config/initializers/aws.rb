Aws.config.update({
  region: 'us-west-1',
  credentials: Aws::Credentials.new(ENV['AKIAJZBYGLFUN3K3RDDA'], ENV['Briefb6nB2xVAPtbSLGGJxTtsAGaaZIY7pJH1HNp']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['pclubassets'])