Turbovax.configure do |config|
  config.twitter_enabled = false
  config.twitter_credentials = {
    consumer_key: ENV["TWITTER_CONSUMER_KEY"],
    consumer_secret: ENV["TWITTER_CONSUMER_SECRET"],
    access_token: ENV["TWITTER_ACCESS_TOKEN"],
    access_token_secret: ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  }
end
