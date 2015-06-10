get '/' do
  erb :index
end

post '/tweet' do
  TwitterUser.tweet(params[:tweet_text])
  redirect to "/"
end

# get '/:username' do
#   @user = TwitterUser.find_or_create_by(username: params[:username])
#   if @user.tweets.empty?
#     @user.fetch_tweets!
#   elsif @user.tweets_stale?
#     @user.tweets.destroy_all
#     @user.fetch_tweets!
#   end
#   @user_timeline = @user.tweets.first(10)
#   erb :timeline
# end
