class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :twitter_users

  def stale?
    if (Time.now - self.created_at) > 100
      return true
    else
      return false
    end
  end

end
