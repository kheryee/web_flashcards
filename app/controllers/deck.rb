get '/deck/:id' do
  @deck = Deck.find params[:id]

  erb :show_deck
end

get '/deck/:id/card/:c_id' do
  if session[:user]
    @user = User.find session[:user]
    @deck = Deck.find params[:id]
    @card = @deck.cards.find params[:c_id]
      erb :start
  else
    redirect '/access_denied'
  end
end

post '/deck/:id/card/:c_id' do
  if session[:user]
    @user = User.find session[:user]
    @deck = Deck.find params[:id]
    @card = @deck.cards.find params[:c_id]
    if @card.check_answer(params[:answer]) == true
      erb :start
    else
      redirect "/deck/#{params[:id]}/card/#{params[:c_id]}"
    end
  else
    redirect '/access_denied'
  end
end
