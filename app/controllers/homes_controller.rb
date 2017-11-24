class HomesController < ApplicationController
  def index
    twitter = TwitterApi.new
    response = twitter.request_api("get", "https://api.twitter.com/1.1/statuses/home_timeline.json?count=20")
    @timelines = Kaminari.paginate_array(JSON.parse(response)).page(params[:page]).per(10)
    @suggestions = JSON.parse(twitter.request_api("get", "https://api.twitter.com/1.1/users/suggestions.json"))
  end

  def follow
    twitter = TwitterApi.new
    response = twitter.request_api("post", "https://api.twitter.com/1.1/friendships/create.json?user_id=#{params[:id]}&follow=true")
    @result = JSON.parse(response)
    @id_str = params[:id]
    respond_to { |format| format.js }
  end

  def suggestion
    twitter = TwitterApi.new
    response = twitter.request_api("get", "https://api.twitter.com/1.1/users/suggestions/#{params[:slug]}.json")
    @members = Kaminari.paginate_array(JSON.parse(response)["users"]).page(params[:page]).per(10)
  end

  def retweet
    twitter = TwitterApi.new
    response = twitter.request_api("post", "https://api.twitter.com/1.1/statuses/retweet/#{params[:id]}.json")
    @tweeted = JSON.parse(response)
    @id_str = params[:id]
    respond_to { |format| format.js }
  end

  def user_detail
    twitter = TwitterApi.new
    response = twitter.request_api("get", "https://api.twitter.com/1.1/users/show.json?user_id=#{current_user.uid}")
    @user = JSON.parse(response)
  end
end
