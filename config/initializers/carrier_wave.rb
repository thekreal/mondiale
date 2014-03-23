CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJ7V3N5ZRJZYAJN4A',                        # required
    :aws_secret_access_key  => '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',                        # required
  }
  config.fog_directory  = 'mondiale'                     # required
end