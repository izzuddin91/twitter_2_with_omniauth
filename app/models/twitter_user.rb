class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets
  def fetch_tweets!
    # byebug
    @user_timeline = $client.user_timeline(self.username).first(10)
    @user_timeline.each do |x|
      Tweet.create(text: x.text, twitter_user_id: self.id)
    end
    @user_timeline
  end

  def tweets_stale?
    if self.tweets.first.stale?
      if ($client.user_timeline(self.username).first.created_at > self.tweets.first.created_at)
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
