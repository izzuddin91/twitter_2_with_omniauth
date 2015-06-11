helpers do
  # define a current_user method, so we can be sure if an user is authenticated
  def current_user
    !session[:uid].nil?
  end
end

get '/' do
  erb :index
end

post '/tweet' do
  @user = TwitterUser.find_by_username(session[:user])
  @client = @user.generate_client
  @client.update(params[:tweet_text])
  redirect to "/"
end

get '/auth/twitter/callback' do
  username = env['omniauth.auth']["extra"]["access_token"].params["screen_name"]
  access_token = env['omniauth.auth'][:credentials][:token]
  access_token_secret = env['omniauth.auth'][:credentials][:secret]

  session[:user] = username

  @user = TwitterUser.find_or_create_by(
    username: username,
    access_token: access_token,
    access_token_secret: access_token_secret)
  # @user.fetch_tweets!
  # this is the main endpoint to your application
  redirect to('/')
end

get '/auth/failure' do
  # omniauth redirects to /auth/failure when it encounters a problem
  # so you can implement this as you please
end