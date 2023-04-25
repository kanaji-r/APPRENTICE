# frozen_string_literal: true

# プレイヤークラス
class Player
  attr_reader :name, :cards

  def initialize(name)
    @cards = []
    @name = name
  end

  def draw(deck, number)
    @cards += deck.draw(number)
  end
end
