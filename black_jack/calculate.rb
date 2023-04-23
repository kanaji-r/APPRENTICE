# frozen_string_literal: true

# 計算するクラス
class Calculate
  def calculate_total(cards)
    # 点数計算
    total = 0
    ace_count = 0
    cards.each do |card|
      total += card.value
      ace_count += 1 if card.rank == 'A'
    end
    while total > 21 && ace_count.positive?
      total -= 10
      ace_count -= 1
    end
    total
  end
end
