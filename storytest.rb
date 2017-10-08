require "./chapter"
require './matrixx'

#枠？の作成とランダムで中に入れとるのね

class Story
  def initialize
    #初期化
    @field = Matrix.new(12, 6)
    @fieldclone =[],[],[],[],[],[]
    
    story01
    story02(@field.mat, @fieldclone, 5)
    #story03
    p "finish"
  end
  
  def story01
    @field.mat.map! do |ary|
      ary.map! do |i|
        i = rand(4)
      end
    end
    @field.tdisp
  end
  
  #なんかjudgeというやつでしたね・・
  def story02(a, b, i)
    p "story02"
    if a[i].size == b[i].size
      if i == 0
          return true
      end
      story02(a, b, i-1)
    end
  end
  
end

Story.new

