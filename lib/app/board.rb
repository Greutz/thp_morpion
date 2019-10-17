class Board

  attr_accessor :array_case

  def initialize
    @array_case = []
    @a1 = BoardCase.new("1", "1")
    @a2 = BoardCase.new('2', "1")
    @a3 = BoardCase.new('3', "1")
    @b1 = BoardCase.new('4', "1")
    @b2 = BoardCase.new('5', "1")
    @b3 = BoardCase.new('6', "1")
    @c1 = BoardCase.new('7', "1")
    @c2 = BoardCase.new('8', "1")
    @c3 = BoardCase.new('9', "1")

    @array_case = [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
  end

  def case_check(choix)
    @array_case.each do |elem|
      return true if elem.position == choix
    end
  end

  def board_change(choix, mark)
    @array_case.map { |elem| elem.position == choix ? elem.position = mark : elem }
  end

  def board_state
    puts " #{@a1.position} | #{@a2.position} | #{@a3.position} "
    puts "---+---+---"
    puts " #{@b1.position} | #{@b2.position} | #{@b3.position} "
    puts "---+---+---"
    puts " #{@c1.position} | #{@c2.position} | #{@c3.position} "
  end


end