#! ruby -Ku
require './matrixx'
require './matconstr'
require './puyoinitialize'
require './yokoku'

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
    @input_key = 6
    p "puyo date:#{@puyo}"
    p "input_key: #{@input_key}"
  end
  
  def yokoku
    p "######yokoku_test#######"   
    p @puyoini.yokoku
    @yokoku_new = Yokoku.new(@puyoini.yokoku, @input_key, @puyo)
    p @yokoku = @yokoku_new.yokoku
    p @puyo = @yokoku_new.puyo
  end
  
  def yokoku_to_field
    p "######yokoku_to_field######"
    p @yokoku
    p @puyo
  end
end

Action.new
