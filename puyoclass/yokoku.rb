require './matrixx'

class Yokoku
  def initialize
    ##予告空間
    @yokoku = Matrix.new(1, 128)
    @yokoku.inputstr(nil)
    @yokoku.mat.map! do |ary|
      ary.map!{|i| i= rand(4)+ 1}
    end
    
    @yokoku.tdisp
    
  end
  
  def story01
    
  end
end


Yokoku.new