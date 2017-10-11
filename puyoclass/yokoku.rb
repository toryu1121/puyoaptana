#! ruby -Ku
require './matrixx'
# require './action' #後でコメントアウト, 消さなきゃaction.rbを実行できない


class Yokoku
  def initialize(yokoku, input_key, puyo, width)
    @yokoku = yokoku
    @input_key = input_key
    @puyo = puyo
    @width = width
    
    #p @yokoku
    #p @input_key = 6

    case @input_key
      when 1
        story01      
      when 2
        story02
      when 3
        story03
      when 6
        story06
    else
      p "何も処理しません"
    end
  end
  attr_accessor :yokoku, :puyo, :width
  
  def story01
    p "story01:左を押しました"
    p "width を-1します"
    @width-=1 unless @width == 0
  end
  
  #落下した時の予告空間の変化
  def story02
    p "story02:下を押しました"
    p "ここでは処理を行いません"
  end
  
  def story03
    p "story03:右を押しました"
    p "width を+1します"
    @width+=1 unless @width == 5
  end
  
  #1手先を固ぷよに、2手先をゾロぷよに変化
  def story06
    p "story06:1手先を固ぷよに、2手先をゾロぷよに変化させます"
    test = rand(4) + 1
    @yokoku[0] = [6, 6]
    @yokoku[1] = [test, test]
  end
end
