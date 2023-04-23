# frozen_string_literal: true

require_relative 'calculate'
# 訳の判定をするクラス
class Judge
  def initialize(calculate)
    @calculate = calculate
  end

  def judge(player_cards, dealer_cards)
    player_total = @calculate.calculate_total(player_cards)
    dealer_total = @calculate.calculate_total(dealer_cards)
    if player_total > 21
      puts 'あなたの負けです。'
    elsif dealer_total > 21
      puts 'あなたの勝ちです。'
    elsif player_total > dealer_total
      puts 'あなたの勝ちです。'
    elsif player_total < dealer_total
      puts 'あなたの負けです。'
    else
      puts '引き分けです。'
    end
  end
end
