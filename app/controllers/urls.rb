enable :sessions

post '/urls' do
  @user = User.find session[:user]
  @url = @user.urls.create(long_url: params[:long_url])
  @short_url = @url.short_url

  erb :short_url
end

get '/:short_url' do
  @url = Url.where(short_url: params[:short_url]).first
  redirect @url.long_url
end