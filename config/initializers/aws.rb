Aws.config.update({
  region: 'us-west-1',
  credentials: Aws::Credentials.new(ENV['S3_KEY'], ENV['S3_SECRET']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])