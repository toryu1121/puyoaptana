require "./chapter"
require './matrixx'

class Story
  def initialize
    #story01
    #story02
    story03
    Chapter.new
  end
  
  def story01
    #予告ぷよ空間
    yokoku = Matrix.new(1, 2)
    yokoku.inputstr(nil)
    yokoku.tdisp
    #操作空間
    sousapuyo = Matrix.new(5, 3)
    sousapuyo.inputstr(nil)
    sousapuyo.tdisp
    #ぷよの枠
    puyowaku = Matrix.new(5, 13)
    puyowaku.inputstr(nil)
    puyowaku.tdisp
  end
  
  def story02
    #予告ぷよ空間
    yokoku = Matrix.new(1, 2)
    yokoku.inputstr(nil)
    
    #最初の初期化
    yokoku.mat.map! do |ary|
      ary.map!{|i| i= rand(4)}
    end
    yokoku.tdisp
    
    10.times do
      sousa = yokoku.mat.shift
      print "#{sousa}\n"
      yokoku.mat.push([rand(4), rand(4)])
      yokoku.tdisp
    end
  end

  def story03
    sousapuyo = Matrix.new(5, 3)
    widthcon = 2
    roll = [0, 1, 2, 3]
    #初期位置
    sousapuyo.inputstr(nil)
    sousapuyo.mat[0][widthcon] = "a"
    sousapuyo.mat[1][widthcon] = "b"
    sousapuyo.tdisp
    
    loop do
      #ぷよの回転
        #一回転する入力
        input = gets.to_i
      case input
        when 1
          widthcon-=1 unless widthcon == 0
        when 2
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
          sousapuyo.tdisp
        when 1
          #もし一番右以外でこの操作がされたら
          unless widthcon == 5
            sousapuyo.inputstr(nil)
            sousapuyo.mat[1][widthcon+1] = "a"
            sousapuyo.mat[1][widthcon] = "b"
            sousapuyo.tdisp
          else
            sousapuyo.inputstr(nil)
            sousapuyo.mat[1][widthcon] = "a"
            sousapuyo.mat[1][widthcon-1] = "b"
            sousapuyo.tdisp
            widthcon = 4
          end
        when 2
          sousapuyo.inputstr(nil)
          sousapuyo.mat[2][widthcon] = "a"
          sousapuyo.mat[1][widthcon] = "b"
          sousapuyo.tdisp
        when 3
          unless widthcon == 0
            sousapuyo.inputstr(nil)
            sousapuyo.mat[1][widthcon-1] = "a"
            sousapuyo.mat[1][widthcon] = "b"
            sousapuyo.tdisp
          else
            sousapuyo.inputstr(nil)
            sousapuyo.mat[1][widthcon] = "a"
            sousapuyo.mat[1][widthcon+1] = "b"
            sousapuyo.tdisp
            widthcon = 1
          end
      end
    end
  end
  
end

Story.new

