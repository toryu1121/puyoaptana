#! ruby -Ku

class Ary_test
  def initialize(mat = 1)
    p @mat_to_str = mat
    
    @database_in = []
    @database_in2 = []
    @test = [1, 2, 3, nil, 4]
    @test2 = [[1,2,3], [4,5,6]]

      
    #story01
    #story02
    #story03
    #story04
    story05
    
    p @mat_to_str
  end
  
  ################配列###########
  def story01
    p @test
    @database_in = @test.join("/")
    p "#########文字列変換########"
    p @database_in
  end
  

  def story02
    @database_in.split("/").map! do |i|
      i = i.to_i
    end
    p "##########配列変換#########"
    p @test
  end
  
  ############行列##############
  def story03
    p @test2
    p "##########文字列変換1#########"
    @test2.each do |ary|
      p @database_in2.push(ary.join("."))
    end
    p "##########文字列変換2#########"
    p @database_in2 = @database_in2.join("/")
  end
  
  def story04
    @database_in2.split("/").map! do |ary|
      ary.split(".").map! do |i|
        i = i.to_i
      end
    end
    p "##########配列変換#########"
    p @test2
  end
################################
  
=begin
  def story05
    @mat_to_str.each do |ary|
      @database_in2.push(ary.join("."))
    end
    p @database_in2 = @database_in2.join("/")
  end
=end
  
  def story05
    karisome = []
    @mat_to_str.map! do |ary|
      karisome.push(ary.join("."))
    end
    p @mat_to_str = karisome.join("/")
  end

  
end


class BB
  def initialize
    @tom = [[1,2,3], [4,5,6],[7, 8, 9]]
    Ary_test.new(@tom)
  end
end

BB.new