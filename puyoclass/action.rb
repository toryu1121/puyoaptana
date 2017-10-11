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
    #puyo_start
    yokoku_test
  end
  
  
  #スタートボタンを押したら開始されるやつ
  def puyo_start
    @puyoini = Puyo_ini.new
    @puyoini.field
    @puyoini.sousa
    @puyoini.yokoku
    
    p Mat_con.new(@puyoini.sousa).mat
    p Mat_con.new(@puyoini.yokoku).mat
    p Mat_con.new(@puyoini.field).mat
    
=begin
    Puyos.new do |i|
      i.field = @field
      i.yokoku = @yokoku
      i.sousa = @sousa
      i.save
    end
=end
  end
  
  def yokoku_test
    @puyoini = Puyo_ini.new
    p @puyoini.yokoku
    input_key = 6
    p puyo = [1, 1]
    @yokoku_new = Yokoku.new(@puyoini.yokoku, input_key, puyo)
    p @yokoku_new.yokoku
    @yokoku_new.input_key
    p @yokoku_new.puyo
  end
end

Action.new
