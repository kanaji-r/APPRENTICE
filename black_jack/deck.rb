# frozen_string_literal: true

require_relative 'card'
# トランプのデッキ
class Deck
  def initialize
    @cards = []

    # カードリスト作成
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards.push(Card.new(suit, rank))
      end
    end
    @cards.shuffle!
  end

  def draw(number)
    @cards.pop(number)
  end
end
