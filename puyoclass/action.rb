#! ruby -Ku
require './matrixx'
require './matconstr'
require './puyoinitialize'
require './yokoku'
require './yokoku2field'

#実行するためのクラス、railsのコントローラに値する

#コントローラ名:puyo
#モデル名:puyos

class Action
  def initialize
    puyo_start
    start_action
    yokoku
    yokoku_to_field
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
    @input_key = 4
    p "puyo date:#{@puyo}"
    p "input_key: #{@input_key}"
  end
  
  def yokoku
    p "######yokoku#######"
    p "roll: #{@roll}"   
    p "yokoku: #{@yokoku}"
    p "puyo: #{@puyo}"
    p "width: #{@width}"
    @yokoku_new = Yokoku.new(@puyoini.yokoku, @input_key, @puyo, @width, @roll)
    @yokoku = @yokoku_new.yokoku
    @puyo = @yokoku_new.puyo
    @width = @yokoku_new.width
    p "roll: #{@roll}" 
    p "yokoku: #{@yokoku}"
    p "puyo: #{@puyo}"
    p "width: #{@width}"
  end
  
  def yokoku_to_field
    p "######yokoku_to_field######"
    #p "yokoku: #{@yokoku}"
    #p "puyo: #{@puyo}"
    #p "width: #{@width}"
    p "roll: #{@roll}" 
    p "yokoku: #{@yokoku}"
    p "puyo: #{@puyo}"
    p "width: #{@width}"
    @yokoku_to_field =  Yokoku_to_field.new(@input_key, @puyo, @field, @width, @yokoku, @roll)
    
    @roll = @yokoku_to_field.roll
    @yokoku = @yokoku_to_field.yokoku
    @puyo = @yokoku_to_field.puyo
    @width = @yokoku_to_field.width
    p "roll: #{@roll}" 
    p "yokoku: #{@yokoku}"
    p "puyo: #{@puyo}"
    p "width: #{@width}"
  end
end

Action.new
