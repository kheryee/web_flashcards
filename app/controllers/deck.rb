get '/deck/:id' do
  @deck = Deck.find params[:id]

  erb :show_deck
end

get '/deck/:id/start' do
  if session[:user]
    @user = User.find session[:user]
    @decks = Deck.all
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
    @card.check_answer(card_id: params[:c_id], answer: params[:answer])
    erb :start_round
  else
    redirect '/access_denied'
  end
end


post '/deck/:id/card/:c_id' do
  if session[:user]
    @user = User.find session[:user]
    @deck = Deck.find params[:id]
    @card = @deck.cards.find params[:c_id]
    @card.check_answer(card_id: params[:c_id], answer: params[:answer])
    erb :next
  else
    redirect '/access_denied'
  end
end
