CarrierWave.configure do |config|
 # config.root = Rails.root.join('tmp') # adding these...
 # config.cache_dir = 'carrierwave' 
 config.cache_dir = "#{Rails.root}/tmp/uploads"
 
  
  config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => 'AKIAJRZB7XFQX4CT3FXA',       # required
      :aws_secret_access_key  => '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',       # required
   #   :region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'sndl'                     # required
   # config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
   config.fog_public     = true                                   # optional, defaults to true
   config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

  
end