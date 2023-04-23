# frozen_string_literal: true

require_relative 'deck'
require_relative 'player'
require_relative 'judge'
require_relative 'calculate'

# ゲームを管理するクラス
class Game
  def initialize
    @deck = Deck.new
    @player = Player.new('あなた')
    @dealer = Player.new('ディーラー')
    @calculate = Calculate.new
    @judge = Judge.new(@calculate)
  end

  def start
    puts 'ブラックジャックを開始します。'
    @player.draw(@deck, 2)
    puts "#{@player.name}の引いたカードは#{@player.cards[0].to_display}です。"
    puts "#{@player.name}の引いたカードは#{@player.cards[1].to_display}です。"
    @dealer.draw(@deck, 2)
    puts "#{@dealer.name}の引いたカードは#{@dealer.cards[0].to_display}です。"
    puts "#{@dealer.name}の引いた2枚目のカードはわかりません。"
    # 21点を超えるまでカードを引くか選ばす(プレイヤー)
    while @calculate.calculate_total(@player.cards) < 21
      # カードを引くか選択
      puts "あなたの得点は#{@calculate.calculate_total(@player.cards)}点です。カードを引きますか？（Y/N）"
      answer = gets.chomp.upcase
      break unless answer == 'Y'

      @player.draw(@deck, 1)
      p "#{@player.name}の引いたカードは#{@player.cards[-1].to_display}です。"

    end
    puts "#{@dealer.name}の引いた2枚目のカードは#{@dealer.cards[1].to_display}でした。"
    puts "#{@dealer.name}の現在の得点は#{@calculate.calculate_total(@dealer.cards)}です。"

    # 17点を超えるまでカードを引く(cpu)
    while @calculate.calculate_total(@dealer.cards) < 17
      @dealer.draw(@deck, 1)
      puts "#{@dealer.name}の引いたカードは#{@dealer.cards[-1].to_display}です。"
    end

    puts "あなたの得点は#{@calculate.calculate_total(@player.cards)}です。"
    puts "ディーラーの得点は#{@calculate.calculate_total(@dealer.cards)}です。"
    # 結果
    puts @judge.judge(@player.cards, @dealer.cards)
  end
end
