#! ruby -Ku
require './matrixx'
require './matconstr'
require './puyoinitialize'
require './yokoku'
require './yokoku2field'
require './tdisp'

#実行するためのクラス、railsのコントローラに値する

#コントローラ名:puyo
#モデル名:puyos

class Action
  def initialize
    puyo_start
    
    loop do
      start_action
      yokoku
      yokoku_to_field
    end
  end
  
  
  #スタートボタンを押したら開始されるやつ
  def puyo_start
    p "######puyo_start######"
    @puyoini = Puyo_ini.new
    @field = @puyoini.field
    @sousa = @puyoini.sousa
    @yokoku = @puyoini.yokoku
    @puyo = @puyoini.puyo
    @width = @puyoini.width
    @roll = @puyoini.roll
    
   # p Mat_con.new(@puyoini.sousa).mat
   # p Mat_con.new(@puyoini.yokoku).mat
   # p Mat_con.new(@puyoini.field).mat
    
=begin
    Puyos.new do |i|
      i.field = @field
      i.yokoku = @yokoku
      i.sousa = @sousa
      i.save
    end
=end
  end
  
  def start_action
    p @yokoku
    Tdisp.new(@sousa)
    # p "puyo date:#{@puyo}"
    Tdisp.new(@field)
    @input_key = gets.to_i
    
  end
  
  def yokoku
    #p "######yokoku#######"
    
=begin
    p "roll: #{@roll}"   
    p "yokoku: #{@yokoku}"
    p "puyo: #{@puyo}"
    p "width: #{@width}"
=end

    @yokoku_new = Yokoku.new(@yokoku, @input_key, @puyo, @width, @roll)
    @yokoku = @yokoku_new.yokoku
    @puyo = @yokoku_new.puyo
    @width = @yokoku_new.width
    
=begin
    p "roll: #{@roll}" 
    p "yokoku: #{@yokoku}"
    p "puyo: #{@puyo}"
    p "width: #{@width}"
=end
    
  end
  
  def yokoku_to_field
    p "######yokoku_to_field######"
    #p "yokoku: #{@yokoku}"
    #p "puyo: #{@puyo}"
    #p "width: #{@width}"
    
=begin
    p "roll: #{@roll}" 
    p "yokoku: #{@yokoku}"
    p "puyo: #{@puyo}"
    p "width: #{@width}"
=end

    @yokoku_to_field =  Yokoku_to_field.new(@input_key, @puyo, @field, @width, @yokoku, @roll, @sousa)
    @roll = @yokoku_to_field.roll
    @yokoku = @yokoku_to_field.yokoku
    @puyo = @yokoku_to_field.puyo
    @width = @yokoku_to_field.width
    @field = @yokoku_to_field.field
    
=begin
    p "roll: #{@roll}" 
    p "yokoku: #{@yokoku}"
    p "puyo: #{@puyo}"
    p "width: #{@width}"
=end
    
  end
end

Action.new
