#コントローラ名:puyo
#モデル名:puyos

#スタートボタンを押したら開始されるやつ
def puyo_start
  @puyoini = puyo_ini.new
  @field = Mat_con.new(@puyoini.field).mat
  @yokoku = Mat_con.new(@puyoini.yokoku).mat
  @sousa = Mat_con.new(@puyoini.sousa).mat
   
  Puyos.new do |i|
    i.field = @field
    i.yokoku = @yokoku
    i.sousa = @sousa
    i.save
  end
end