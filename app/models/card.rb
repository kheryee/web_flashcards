class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def check_answer(answer)

    if self.answer == answer
      true
    else
      false
    end
  end
end
