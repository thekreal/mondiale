CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'changed',                        # required
    :aws_secret_access_key  => 'changed',                        # required
  }
  config.fog_directory  = 'mondiale'                     # required
end