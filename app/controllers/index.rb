get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_or_create_by(username: params[:username])
  if @user.tweets.empty?
    @user.fetch_tweets!
  elsif @user.tweets_stale?
    @user.tweets.destroy_all
    @user.fetch_tweets!
  end
  @user_timeline = @user.tweets.first(10)
  erb :timeline
end

post '/username' do

  redirect to "#{params[:user]}"
end
