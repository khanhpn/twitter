class TwitterApp
  attr_accessor :client, :current_user

  def initialize(current_user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_app_id,
      config.consumer_secret     = Rails.application.secrets.twitter_app_secret,
      config.access_token        = Rails.application.secrets.twitter_access_token,
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end
    @current_user = current_user
    binding.pry
  end

  def get_tweets
    @client.user_timeline(current_user.uid)
  end
end
