#! ruby -Ku

class Ary_test
  def initialize(mat = 1)
    p @mat_to_str = mat  
    story05
    

    story06
    p @mat_to_str
    
    #story07
    #story08
  end
  attr_accessor :mat_to_str
  
############行列から文字列####################  
  def story05
    karisome = []
    
    @mat_to_str.map do |ary|
      ary.push(0) if ary.size == 0
    end  
      
    @mat_to_str.map! do |ary|
      karisome.push(ary.join("."))
    end
    p @mat_to_str = karisome.join("/")
  end
  
  
  def story06
    karisome = [] 
      
    @mat_to_str.split("/").map! do |ary|
      karisome.push(ary.split("."))
    end

    karisome.map! do |ary|
      ary.map! do |i|
        if i.to_i == 0
          i = nil
        else
          i = i.to_i
        end
      end
    end
    @mat_to_str = karisome
    
    @mat_to_str.map do |i|
      i.compact!
    end
  end
  
  def story07
    b = [], [], [1], []
    p b
    
    b.map do |ary|
      if ary.size == 0
        ary.push(0)
      end
    end
    p b
  end
  
  def story08
    b = [0], [0], [1], [0]
    p b
    b.map do |ary|
      ary.map! do |i|
        i == 0 ? i = nil : i = i
      end
    end
    
    p b
    
    b.map do |i|
      i.compact!
    end
    
    p b
  end

  
end




class BB
  def initialize
    @tom = [[1,2,3],[],  [4,5,6],[]]
    #@tom = [],[],[],[],[],[]
    test = Ary_test.new(@tom)
    #p test.mat_to_str
  end
end

BB.new

