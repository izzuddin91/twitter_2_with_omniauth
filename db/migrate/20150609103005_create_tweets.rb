class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |tweet|
      tweet.string :text
      tweet.integer :twitter_user_id
      tweet.float :stale_time
      tweet.timestamps
    end
  end
end
