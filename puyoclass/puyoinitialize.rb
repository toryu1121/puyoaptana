require './matrixx'
require './matconstr'
#0: 空の配列を表す
#1-4: ぷよの各配色を表す
#9: 操作空間を埋めつくす物体・・？,nilの代わりに入れます

class Puyo_ini
  def initialize
    story01
    story02
    story03
  end
  attr_accessor :yokoku, :sousa, :field
  
  def story01
    ##予告空間
    yokoku = Matrix.new(1, 128)
    yokoku.inputstr(nil)
    yokoku.mat.map! do |ary|
      ary.map!{|i| i= rand(4)+ 1}
    end
    yokoku.tdisp
    @yokoku = yokoku.mat
  end
  
  def story02
    sousa = Matrix.new(5, 3)
    sousa.inputstr(9)
    sousa.tdisp
    @sousa = sousa.mat
  end
  
  def story03
    field = Matrix.new(1, 6, 1)
    field.tdisp
    @field = field.mat
  end
end



class CCC
  def initialize
    @puyoini = Puyo_ini.new
    @puyoini.field
    @puyoini.sousa
    @puyoini.yokoku
    
    p Mat_con.new(@puyoini.sousa).mat
    p Mat_con.new(@puyoini.yokoku).mat
    p Mat_con.new(@puyoini.field).mat

  end
end

CCC.new
