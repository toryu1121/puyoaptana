#! ruby -Ku

class Ary_test
  def initialize(input = 1)
    if input.is_a?(String)
      @str = input
      story07
    else
      @mat = input
      story08
    end
  end
  attr_accessor :mat, :str
  
############文字列から行列####################  
  def story07
    @mat = [] 
    @str.split("/").map! do |ary|
      @mat.push(ary.split("."))
    end

    @mat.map! do |ary|
      ary.map! do |i|
        i.to_i == 0 ? i = nil : i = i.to_i
      end
    end
    
    @mat.map do |i|
      i.compact!
    end    
  end
  
  ##########行列から文字列########
  def story08
    karisome = []
    @mat.map do |ary|
      ary.push(0) if ary.size == 0
    end  
      
    @mat.map! do |ary|
      karisome.push(ary.join("."))
    end
    @mat = karisome.join("/")
    @str = @mat
  end
end



require './matrixx'


class BB
  def initialize
    field = Matrix.new(12, 6)
    field.mat.map! do |ary|
      ary.map! do |i|
        i = rand(4) + 1
      end
    end
    field.tdisp
    
    #@tom = [[1,2,3],[],  [4,5,6],[]]
    #@tom = [],[],[],[],[],[]
    #@tom = "0/0/3.3.3/0/0/0"
    @tom = field.mat
    
    
    p @tom
    test = Ary_test.new(@tom)
    p test.mat
    
    mumu = Ary_test.new(test.mat)
    p mumu.mat
  end
end

BB.new

