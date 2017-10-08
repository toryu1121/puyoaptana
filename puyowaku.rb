#操作空間
require './matrixx'
sousapuyo = Matrix.new(5, 3)
widthcon = 2
roll = [0, 1, 2, 3]
#初期位置
sousapuyo.inputstr(nil)
sousapuyo.mat[0][widthcon] = "a"
sousapuyo.mat[1][widthcon] = "b"
sousapuyo.tdisp
#ぷよの枠
puyowaku = Matrix.new(1,6 , 1)
puyowaku.inputstr(nil)
puyowaku.tdisp


loop do
#ぷよの回転
  #一回転する入力
  input = gets.to_i
case input
  when 1
    widthcon-=1 unless widthcon == 0
  when 2 #落下させる
    case roll[0]
      when 0
        puyowaku.mat[widthcon].push("b") if puyowaku.mat[widthcon].size < 13
        puyowaku.mat[widthcon].push("a") if puyowaku.mat[widthcon].size < 13
      when 1 #右向いてる
        puyowaku.mat[widthcon].push("b") if puyowaku.mat[widthcon].size < 13
        puyowaku.mat[widthcon+1].push("a") if puyowaku.mat[widthcon+1].size < 13
      when 2
        puyowaku.mat[widthcon].push("a") if puyowaku.mat[widthcon].size < 13
        puyowaku.mat[widthcon].push("b") if puyowaku.mat[widthcon].size < 13
      when 3 #左向いてる
        puyowaku.mat[widthcon].push("b") if puyowaku.mat[widthcon].size < 13
        puyowaku.mat[widthcon-1].push("a") if puyowaku.mat[widthcon-1].size < 13
    end
  when 3
    widthcon+=1 unless widthcon == 5
  when 4
    roll.unshift(roll.pop)
  when 5
    roll.push(roll.shift)
    else
     break
end

case roll[0]
  when 0
    sousapuyo.inputstr(nil)
    sousapuyo.mat[0][widthcon] = "a"
    sousapuyo.mat[1][widthcon] = "b"
  when 1
    #もし一番右以外でこの操作がされたら
    unless widthcon == 5
      sousapuyo.inputstr(nil)
      sousapuyo.mat[1][widthcon+1] = "a"
      sousapuyo.mat[1][widthcon] = "b"
    else
      sousapuyo.inputstr(nil)
      sousapuyo.mat[1][widthcon] = "a"
      sousapuyo.mat[1][widthcon-1] = "b"
      widthcon = 4
    end
  when 2
    sousapuyo.inputstr(nil)
    sousapuyo.mat[2][widthcon] = "a"
    sousapuyo.mat[1][widthcon] = "b"
  when 3
    unless widthcon == 0
      sousapuyo.inputstr(nil)
      sousapuyo.mat[1][widthcon-1] = "a"
      sousapuyo.mat[1][widthcon] = "b"
    else
      sousapuyo.inputstr(nil)
      sousapuyo.mat[1][widthcon] = "a"
      sousapuyo.mat[1][widthcon+1] = "b"
      widthcon = 1
    end
end
sousapuyo.tdisp
puyowaku.tdisp
end