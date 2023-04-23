# frozen_string_literal: true

# カード情報を管理するクラス
class Card
  attr_reader :suit, :rank, :value

  SUITS = %w[スペード ダイヤ クラブ ハート].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @value = calculate_value
  end

  def calculate_value
    if @rank.to_i.zero?
      case rank
      when 'A'
        11
      when 'J', 'Q', 'K'
        10
      end
    else
      @rank.to_i
    end
  end

  def to_display
    "#{@suit}の#{@rank}"
  end
end
