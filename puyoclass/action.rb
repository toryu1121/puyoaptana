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
    key_input_ok
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
  
  def key_input_ok
    @puyoini = Puyo_ini.new
    input_key = 1
    Yokoku.new(@puyoini.yokoku, input_key)
  end
end

Action.new
