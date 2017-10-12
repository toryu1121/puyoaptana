require './matrixx'

class Tdisp
  def initialize(mat)
    mat.map do |ary|
      p ary
    end
    puts("\n")
  end
end

  

class AA
  def initialize
    @roll = [0, 1, 2, 3]
    @sousa_mat = Matrix.new(5, 3)
    @sousa = @sousa_mat.mat
    @sousa_mat.inputstr(nil)
    @puyo_a = 0
    @puyo_b = 1
    @width = 0
    @roll[0] = 3
    test2
    
    Tdisp.new(@sousa)
  end
  
  def test1
    #@sousa.inputstr(nil)
    @sousa.map! do |ary|
      ary.map! do |i|
        i = 9
      end
    end
  end
  
  def test2
    case @roll[0]
      when 0
        test1
        @sousa[0][@width] = @puyo_a
        @sousa[1][@width] = @puyo_b
      when 1
        #もし一番右以外でこの操作がされたら
        unless @width == 5
          test1
          @sousa[1][@width+1] = @puyo_a
          @sousa[1][@width] = @puyo_b
        else
          test1
          @sousa[1][@width] = @puyo_a
          @sousa[1][@width-1] = @puyo_b
          @width = 4
        end
      when 2
        test1
        @sousa[2][@width] = @puyo_a
        @sousa[1][@width] = @puyo_b
      when 3
        unless @width == 0
          test1
          @sousa[1][@width-1] = @puyo_a
          @sousa[1][@width] = @puyo_b
        else
          test1
          @sousa[1][@width] = @puyo_a
          @sousa[1][@width+1] = @puyo_b
          @width = 1
        end
    end
  end
  
end

AA.new