class TwitterApi
  def prepare_access_token
    consumer = OAuth::Consumer.new(Rails.application.secrets.YOUR_CONSUMER_KEY, Rails.application.secrets.YOUR_CONSUMER_SECRET, {site: "https://api.twitter.com", scheme: :header })

    # now create the access token object from passed values
    token_hash = {oauth_token: Rails.application.secrets.YOUR_ACCESS_TOKEN, oauth_token_secret: Rails.application.secrets.YOUR_ACCESS_SECRET }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

    return access_token
  end

  def request_api(http_verb, url_request)
    prepare_access_token.request(http_verb.to_sym, url_request).body
  end

  def retweet(http_verb, url_request, id_str)
    prepare_access_token.request(http_verb.to_sym, url_request)
  end
end
