class Player
  attr_accessor :name, :mark, :count

  def initialize(name, mark)
    @name = name
    @mark = mark
    @count = 0
  end

end