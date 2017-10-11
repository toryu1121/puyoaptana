#! ruby -Ku
#require './action' #後でコメントアウト, 消さなきゃaction.rbを実行できない

class Yokoku_to_field
  def initialize(input_key, puyo, field, width, yokoku, roll)
    @roll = roll
    @yokoku = yokoku
    @puyo = puyo
    @field = field
    @width = width
    #p @field
    #p @puyo
    #p "width: #{@width}"
    
    if input_key == 2
      p "下を押しました"
      p "落下処理を行います"
      
      p "fieldに移動したらstory02を実行しましょうね"
      story02
    else
      p "何も処理しません"
    end
  end
  attr_accessor :yokoku, :puyo, :width, :roll
  
  def story02
    @yokoku.push(@puyo)
    @puyo = @yokoku.shift
  end
end