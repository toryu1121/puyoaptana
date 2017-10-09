
###クラス化version
class AA
  def initialize
    #story01_start
    story02_start
    story02_start
  end
    
  def story01(arr)
    p arr
      return 0 if arr.empty? #配列が空のときは終了
      top = arr.shift
      @answer = top + story01(arr)
  end
  
  def story01_start
    arr = [1,2,3,4,5]
    p arr
    story01(arr) #=> @top + aa_sum(arr)の値を表示
    
    p "answer:#{@answer}"
  end
  
  
  
  
  
  #引数を使わない再起処理
  def story02
    p @arr_arr
      return 0 if @arr_arr.empty? #配列が空のときは終了
      top = @arr_arr.shift
      @answer = top + story02
  end
  
  def story02_start
    p @arr_arr = [1,2,3,4,5]
    story02
    p "answer:#{@answer}"
  end
  
end

AA.new

