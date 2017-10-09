#! ruby -Ku

class Ary_test
  def initialize(input = 1)
    @mat_to_str = input  
    @mat = 1
    @str = 1
    
    if input.is_a?(String)
      @str = input
      p "行列に変換"
      story07
      p @mat
    else
      @mat = input
      p "文字列に変換"
      story08
      @str = @mat
      p @str
    end
    #p @mat_to_str
  end
  attr_accessor :mat, :str
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
    @mat_to_str = karisome.join("/")
  end
  
  
  def story06
    karisome = [] 
      
    @mat_to_str.split("/").map! do |ary|
      karisome.push(ary.split("."))
    end

    karisome.map! do |ary|
      ary.map! do |i|
        i.to_i == 0 ? i = nil : i = i.to_i
      end
    end
    @mat_to_str = karisome
    
    @mat_to_str.map do |i|
      i.compact!
    end
  end
  
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
  
  ##################
  def story08
    karisome = []
    @mat.map do |ary|
      ary.push(0) if ary.size == 0
    end  
      
    @mat.map! do |ary|
      karisome.push(ary.join("."))
    end
    @mat = karisome.join("/")
  end
end






class BB
  def initialize
    #@tom = [[1,2,3],[],  [4,5,6],[]]
    @tom = [],[],[],[],[],[]
    p @tom
    #p @tom = "0/0/3.3.3/0/0/0"
    test = Ary_test.new(@tom)
    #p test
    #p test.mat_to_str
  end
end

BB.new

