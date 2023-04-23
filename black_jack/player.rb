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

  # def select_draw(number)
  #   while calculate_total(player_cards) < 21
  #     # カードを引くか選択
  #     puts "あなたの得点は#{calculate_total(player_cards)}点です。カードを引きますか？（Y/N）"
  #     answer = gets.chomp.upcase
  #     if answer == "Y"
  #       # トランプからカードを一枚取る(自分)
  #       player_cards += draw_cards(deck, number)
  #       p "あなたの引いたカードは#{player_cards[-1][:suit]}の#{player_cards[-1][:rank]}です。"

  #     else
  #       break
  #     end
  #   end
  # end
end
