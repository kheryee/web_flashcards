enable :sessions

get '/' do
  if session[:user]
    @user = User.find session[:user]
    @decks = Deck.all
    erb :home
  else
    erb :index
  end
end
