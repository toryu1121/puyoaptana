#! ruby -Ku
require './matrixx'
# require './action' #後でコメントアウト, 消さなきゃaction.rbを実行できない


class Yokoku
  def initialize(yokoku, input_key, puyo)
    @yokoku = yokoku
    @input_key = input_key
    @puyo = puyo
    
    #p @yokoku
    #p @input_key = 6

    case @input_key
      when 2
        story02
      when 6
        story06
    end
  end
  attr_accessor :yokoku, :input_key, :puyo
  
  #落下した時の予告空間の変化
  def story02
    p "story02:下を押しました"
    @yokoku.push(@puyo)
    @puyo = @yokoku.shift
  end
  
  #1手先を固ぷよに、2手先をゾロぷよに変化
  def story06
    p "story06:1手先を固ぷよに、2手先をゾロぷよに変化させます"
    test = rand(4) + 1
    @yokoku[0] = [6, 6]
    @yokoku[1] = [test, test]
  end
end
