#! ruby -Ku
require "./chapter"
require './matrixx'

#chain4 puyo_story03

#枠？の作成とランダムで中に入れとるのね

class Story
  def initialize
    #初期化
    @field = Matrix.new(12, 6)
    @fieldclone =[],[],[],[],[],[]
    story01
    p @fieldclone = @field.mat.dup
    
    story04
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
  #わかった！！連鎖処理の前の状態をcloneに保存しておいて
  #cloneと処理後の状態を比較して同じならブレイクしましょうねーっていうやつや！
  #でも6回しか比較してないぞ...??...これ再起じゃなくてよくね！！
  #通過するのか
  
  #なるほど、連鎖したらどこかしらサイズ変わってるよねってことか・・
  def story02(a, b, i)
    p a[i]
    p b[i]
    
    if a[i].size == b[i].size
      if i == 0
          p "探索終了ですね"
          return true
      end
      p "一致"
      
      story02(a, b, i-1)
    end
  end
  
  
  def story03(a, b)
    @tom = 0
    5.times do |i|
      if a[i].size == b[i].size
        @tom += 1
        p @tom
      end
    end
    if @tom == 5
      p "trueを返そうじゃないか"
      @tom = true
    end
  end
  
  
  #完成ですね
  def story04
    @tom = 1
    5.times do |i|
      if @field.mat[i].size == @fieldclone[i].size
        @tom += 1
      end
    end
    
    #これで@tomが6なら連鎖終了でＯＫ(一致数が6)    
    p @tom
    
  end
  
end

Story.new