require 'open-uri'
require 'byebug'

class Seed

  @deck = []

  def self.process_file

    File.open('db/english-german.txt', 'r') do |f1|
      while line = f1.gets
        @deck << line.chomp
      end
    end

    deck = Deck.create(name: "English-German")

    @deck.each do |x|
      q_a = x.split(' ')
      Card.create(deck_id: deck.id, question: q_a[0], answer: q_a[1])
    end
    # @card.shuffle!
  end




    # Deck.create(name: 'English-Malay')

end

Seed.process_file