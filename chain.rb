require './matrixx'

#枠？の作成とランダムで中に入れとるのね
field = Matrix.new(12, 6)
field.mat.map! do |ary|
  ary.map! do |i|
    i = rand(4)
  end
end
field.tdisp

#なんかのメソッド。ああ、再起処理させてるのねそれにしてもリターンが無駄な気が・・・
#rubyで返り値使うなんて・・C言語じゃないんだから・・・
#やっぱり"_"使わなきゃわかりにくくなるね
#分かりにくい・・・
def judge(a, b, i)
  if a[i].size == b[i].size
    if i == 0
        return true
    end
    judge(a, b, i-1)
  end
end

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


#多分メインの処理の部分でここがループしてるんでしょうね
fieldclone =[],[],[],[],[],[]
chainecount = 0

loop do
  
  if judge(field.mat, fieldclone, 5)
    break
  end
  
  
  #正直for文を使っているのが信じられん・・・
  fieldclone = field.mat.dup
  #もしfield.mat[][]がnil以外なら
  for i in 0...6
    for j in 0...13
      unless field.mat[i][j] == nil
        #こいつが４以上ならもう一度-1で捜索して-1をnilに置き換える
        if puyo(i, j, field.mat) >= 4
          deletepuyo(i, j, field.mat)
        end
      end
    end
  end
  
  field.tdisp
  field.mat.map! do |ary|
    unless ary == []
      ary = ary.compact
    else
      ary = []
    end
  end
  
  chainecount += 1
  p "#{chainecount}chaine"
  field.tdisp
end