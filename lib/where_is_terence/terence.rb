class Terence
  def location
    tweet.place.full_name
  end

  def date
    timestamp.to_date
  end

  private

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
    end
  end

  def tweets
    @tweets ||= twitter_client.user_timeline("hone02")
  end

  def tweet
    @tweet ||= tweets.detect { |tweet| tweet.place? }
  end

  def timestamp
    tweet.created_at
  end
end
