require './matrixx'

#0: 空の配列を表す
#1-4: ぷよの各配色を表す
#9: 操作空間を埋めつくす物体・・？,nilの代わりに入れます

class Puyo_ini
  def initialize
    story01
    story02
    story03
    @roll = [0, 1, 2, 3]
  end
  attr_accessor :yokoku, :sousa, :field, :puyo, :width, :roll
  
  def story01
    ##予告空間
    yokoku = Matrix.new(1, 128)
    yokoku.inputstr(nil)
    yokoku.mat.map! do |ary|
      ary.map!{|i| i= rand(4)+ 1}
    end
    #yokoku.tdisp
    @yokoku = yokoku.mat
  end
  
  def story02
    @width = 2
    sousa = Matrix.new(5, 3)
    sousa.inputstr(9)
    @puyo = []
    @puyo[0] = rand(4) + 1
    @puyo[1] = rand(4) + 1
    sousa.mat[0][@width] = @puyo[0]
    sousa.mat[1][@width] = @puyo[1]
    sousa.tdisp
    @sousa = sousa.mat
  end
  
  def story03
    field = Matrix.new(1, 6, 1)
    #field.tdisp
    @field = field.mat
  end
end
