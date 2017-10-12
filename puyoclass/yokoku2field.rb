#! ruby -Ku
#require './action' #後でコメントアウト, 消さなきゃaction.rbを実行できない
#require './tdisp'

class Yokoku_to_field
  def initialize(input_key, puyo, field, width, yokoku, roll, sousa)
    @roll = roll
    @yokoku = yokoku
    @puyo = puyo
    @field = field
    @width = width
    @sousa = sousa
 
    
    @puyo_a = @puyo[0]
    @puyo_b = @puyo[1]
    #p @field
    #p @puyo
    #p "width: #{@width}"
    
    
    
    if input_key == 2
      #落下処理
      story01
      #予告空間の処理s
      story02
      test2
    else
      #操作の描画処理のみ行います
      test2
    end
  end
  attr_accessor :yokoku, :puyo, :width, :roll, :field, :sousa
  
  def test1
    #@sousa.inputstr(nil)
    @sousa.map! do |ary|
      ary.map! do |i|
        i = 9
      end
    end
  end
  
  def test2
    case @roll[0]
      when 0
        test1
        @sousa[0][@width] = @puyo_a
        @sousa[1][@width] = @puyo_b
      when 1
        #もし一番右以外でこの操作がされたら
        unless @width == 5
          test1
          @sousa[1][@width+1] = @puyo_a
          @sousa[1][@width] = @puyo_b
        else
          test1
          @sousa[1][@width] = @puyo_a
          @sousa[1][@width-1] = @puyo_b
          @width = 4
        end
      when 2
        test1
        @sousa[2][@width] = @puyo_a
        @sousa[1][@width] = @puyo_b
      when 3
        unless @width == 0
          test1
          @sousa[1][@width-1] = @puyo_a
          @sousa[1][@width] = @puyo_b
        else
          test1
          @sousa[1][@width] = @puyo_a
          @sousa[1][@width+1] = @puyo_b
          @width = 1
        end
    end
  end
  
  #
  def story01
    case roll[0]
      when 0
        @field[@width].push(@puyo_b) if @field[@width].size < 13
        @field[@width].push(@puyo_a) if @field[@width].size < 13
      when 1 #右向いてる
        @field[@width].push(@puyo_b) if @field[@width].size < 13
        @field[@width+1].push(@puyo_a) if @field[@width+1].size < 13
      when 2
        @field[@width].push(@puyo_a) if @field[@width].size < 13
        @field[@width].push(@puyo_b) if @field[@width].size < 13
      when 3 #左向いてる
        @field[@width].push(@puyo_b) if @field[@width].size < 13
        @field[@width-1].push(@puyo_a) if @field[@width-1].size < 13
    end
  end
  
  #予告空間を変化させます
  def story02
    @yokoku.push(@puyo)
    @puyo = @yokoku.shift
  end
end