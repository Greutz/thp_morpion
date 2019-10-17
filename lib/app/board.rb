class Board

  attr_accessor :array_case

  def initialize
    @array_case = []
    @a1 = BoardCase.new("1")
    @a2 = BoardCase.new('2')
    @a3 = BoardCase.new('3')
    @b1 = BoardCase.new('4')
    @b2 = BoardCase.new('5')
    @b3 = BoardCase.new('6')
    @c1 = BoardCase.new('7')
    @c2 = BoardCase.new('8')
    @c3 = BoardCase.new('9')

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

  def board_wipe
    @array_case.map.with_index { |elem, i| elem.position = (i + 1).to_s }
  end

  def board_state
    puts "\n\t\t #{@a1.position} | #{@a2.position} | #{@a3.position}"
    puts "\t\t---+---+---"
    puts "\t\t #{@b1.position} | #{@b2.position} | #{@b3.position}"
    puts "\t\t---+---+---"
    puts "\t\t #{@c1.position} | #{@c2.position} | #{@c3.position}"
  end

  def player1_wins
    if @a1.position == "X" && @a2.position == "X" && @a3.position == "X"
      true

    elsif @b1.position == "X" && @b2.position == "X" && @b3.position == "X"
      true

    elsif @c1.position == "X" && @c2.position == "X" && @c3.position == "X"
      true

    elsif @a1.position == "X" && @b1.position == "X" && @c1.position == "X"
      true

    elsif @a2.position == "X" && @b2.position == "X" && @c2.position == "X"
      true

    elsif @a3.position == "X" && @b3.position == "X" && @c3.position == "X"
      true

    elsif @a1.position == "X" && @b2.position == "X" && @c3.position == "X"
      true

    elsif @a3.position == "X" && @b2.position == "X" && @c1.position == "X"
      true
    else
      false
    end
  end

  def player2_wins
    if @a1.position == "O" && @a2 == "O" && @a3 == "O"
      true
    elsif @b1.position == "O" && @b2.position == "O" && @b3.position == "O"
      true
    elsif @c1.position == "O" && @c2.position == "O" && @c3.position == "O"
      true
    elsif @a1.position == "O" && @b1.position == "O" && @c1.position == "O"
      true
    elsif @a2.position == "O" && @b2.position == "O" && @c2.position == "O"
      true
    elsif @a3.position == "O" && @b3.position == "O" && @c3.position == "O"
      true
    elsif @a1.position == "O" && @b2.position == "O" && @c3.position == "O"
      true
    elsif @a3.position == "O" && @b2.position == "O" && @c1.position == "O"
      true
    else
      false
    end
  end
end