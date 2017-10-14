require './matrixx'
require './tdisp'

class Chain
  def initialize(field)
    p "chain.new"
    @field = field
    @fieldclone =[],[],[],[],[],[]
    @chainecount = 0
    Tdisp.new(@field)
     
    #多分メインの処理
    loop do
      break if story01 == true
      story02
      Tdisp.new(@field)
      story03
      story04 #chainカウント+１
      Tdisp.new(@field)
    end
  end
  
  attr_accessor :field, :chainecount
  
  
  ###############メソッドども##################  
  #連鎖終了か判断,二つの行列が一致するか判断
  def story01
    judge_count = 1
    5.times do |i|
      if @field[i].size == @fieldclone[i].size
        judge_count += 1
      end
    end
    judge_count == 6 ? true : false
  end
  
  #nilに置き換える
  def story02
    @fieldclone = @field.dup
    #もしfield[][]がnil以外なら
    for i in 0...6
      for j in 0...13
        unless @field[i][j] == nil
          #こいつが４以上ならもう一度-1で捜索して-1をnilに置き換える
          if puyo(i, j, @field) >= 4
            deletepuyo(i, j, @field)
          end
        end
      end
    end
  end
  
  def story03
    @field.map! do |ary|
      unless ary == []
        ary = ary.compact
      else
        ary = []
      end
    end
  end
  
  def story04
    @chainecount += 1
    p "#{@chainecount}chaine"
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
ok = Chain.new(field.mat)

p "###########"
p ok.field
p ok.chainecount








