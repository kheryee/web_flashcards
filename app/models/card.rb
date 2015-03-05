class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def self.check_answer(card_id, answer)
    card = self.find(card_id)

    if card.answer == answer
      true
    else
      false
    end
  end
end
