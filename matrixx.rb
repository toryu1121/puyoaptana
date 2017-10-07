module Mat
  def tdisp(testary)
    (testary.size).times do |i|
    p testary[i]
  end
  puts("\n")
  end

  def disp(testary)
    (testary.size).times do |i|
      puts testary[i]
    end
  puts("\n")
  end

  def pdisp(testary)
    (testary.size).times do |i|
      print testary[i].join
    end
    puts("\n")
    end
  end

class Matrix
  def initialize(width, high, choice = 0)
    @high  = high
    @width = width
    if choice == 0
      self.matrixwid
    else
      self.matrix
    end
  end
  attr_accessor :mat
  ##############sefl変数の練習################
  def testdisp
    (self.size).times do |i|
    p self[i]
  end
  puts("\n")
  end
#############行列の作成、第三引数を指定した場合matrixが適用##############
  def matrixwid
        @mat = []
    for i in 1..@high
      @mat.push([])
    end

    for j in 0..(@high - 1)
      @mat[j][@width] = "\n"
    end
    return @mat
  end

  def matrix
    @mat = []
    for i in 1..@high
      @mat.push([])
    end
    return @mat
  end
  ######引数の行列をp, print, putsで表示する
  def tdisp
    (@mat.size).times do |i|
    p @mat[i]
  end
  puts("\n")
  end

  def disp
    (@mat.size).times do |i|
    puts @mat[i]
  end
  puts("\n")
  end

  def pdisp
    (@mat.size).times do |i|
    print @mat[i].join
  end
  puts("\n")
  end
  ###########読み込んだ行列に入力する######mat=行列#########
  def input
    @mat.map! do |matary|
      input = gets.split
      matary.each_index do |i|
       matary[i] = input[i].to_i
      end
    end
    return @mat
  end
  ##############################
  def inputstr(inp)
    @mat.map! do |ary|
      ary.map!{|i| i = inp}
    end
  end
end