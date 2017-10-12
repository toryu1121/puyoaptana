require './matrixx'
require './tdisp'

class Chain
  def initialize(field)
    p "chain.new"
    
    @field = field
    Tdisp.new(@field)
    
    
    @fieldclone =[],[],[],[],[],[]
    @chainecount = 0
    @field = Matrix.new(12, 6)
    story01 #フィールドにランダム数字の代入
    @field.tdisp
    
    
    #多分メインの処理の部分でここがループしてるんでしょうね
    loop do
      
      break if story02 == true
      
      
      #正直for文を使っているのが信じられん・・・
      @fieldclone = @field.mat.dup
      #もしfield.mat[][]がnil以外なら
      for i in 0...6
        for j in 0...13
          unless @field.mat[i][j] == nil
            #こいつが４以上ならもう一度-1で捜索して-1をnilに置き換える
            if puyo(i, j, @field.mat) >= 4
              deletepuyo(i, j, @field.mat)
            end
          end
        end
      end
      
      @field.tdisp
      @field.mat.map! do |ary|
        unless ary == []
          ary = ary.compact
        else
          ary = []
        end
      end
      
      @chainecount += 1
      p "#{@chainecount}chaine"
      @field.tdisp
    end
  end
  ###############メソッドども##################
  #フィールドにランダムの数字を代入
  def story01
    p "story01"
    @field.mat.map! do |ary|
      ary.map! do |i|
        i = rand(4) + 1
      end
    end
  end
  
  #連鎖終了か判断,二つの行列が一致するか判断
  def story02
    judge_count = 1
    5.times do |i|
      if @field.mat[i].size == @fieldclone[i].size
        judge_count += 1
      end
    end
    judge_count == 6 ? true : false
  end
  
  
  ###########再帰的な方のメソッドども###############
  #なにかのメソッド,探索のみ？必要？
  #これも再起処理かぁいややねぇ
  def puyo(row, col, test)
    c = test[row][col]
    n = 1
    test[row][col] = -1
    #右
    if (col + 1 < 13) && (test[row][col + 1] == c)
      n+= puyo(row, col + 1, test)
    end
    #上
    if (row - 1 >= 0) && (test[row - 1][col] == c)
      n+= puyo(row - 1,col , test)
    end
    #下に行く
    if (row+1 < 6) && (test[row+1][col]==c)
        n+=puyo(row+1,col,test)
    end
    #左に行く
    if (col - 1>= 0) && (test[row][col-1]==c)
        n+=puyo(row ,col-1,test)
    end
    test[row][col] = c
    return n
  end
  
  #めいんの処理のメソッド？探索したうえでnilに置き換えてる？
  def deletepuyo(row, col, test)
    c = test[row][col]
    n = 1
    test[row][col] = nil
    #右
    if (col + 1 < 13) && (test[row][col + 1] == c)
      n+= deletepuyo(row, col + 1, test)
    end
    #上
    if (row - 1 >= 0) && (test[row - 1][col] == c)
      n+= deletepuyo(row - 1,col , test)
    end
    #下に行く
    if (row+1 < 6) && (test[row+1][col]==c)
        n+=deletepuyo(row+1,col,test)
    end
    #左に行く
    if (col - 1>= 0) && (test[row][col-1]==c)
        n+=deletepuyo(row ,col-1,test)
    end
    return n
  end
  
end

field = Matrix.new(12, 6)
field.mat.map! do |ary|
  ary.map! do |i|
    i = rand(4) + 1
  end
end
Chain.new(field.mat)







