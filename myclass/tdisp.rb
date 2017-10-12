class Tdisp
  def initialize(mat)
    mat.map do |ary|
      p ary
    end
    puts("\n")
  end
end