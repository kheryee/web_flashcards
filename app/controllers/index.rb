enable :sessions

get '/' do

  erb :index
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user] = @user.id
    redirect '/home'
  else
    redirect '/error'
  end
end

get '/error' do
  erb :error
end

post '/register' do
  User.create(params[:user])

  redirect '/home'
end

get '/home' do
  if session[:user]
    @user = User.find session[:user]
    erb :home
  else
    redirect '/access_denied'
  end
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end

get '/access_denied' do
  erb :access_denied
end