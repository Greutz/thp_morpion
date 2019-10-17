require 'player'
# Classe gérant le board
class Board < Player
  attr_accessor :array_case

  # On crée les 9 cases et on les stockes dans un array
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
    super(name, mark)
  end

  # Méthode vérifiant la disponibilité d'une case
  def case_check(choix)
    @array_case.each do |elem|
      return true if elem.position == choix
    end
  end

  # Méthode transformant le board via l'array
  def board_change(choix, mark)
    @array_case.map { |elem| elem.position == choix ? elem.position = mark : elem }
  end

  # Méthode remettant le board à 0 après une partie
  def board_wipe
    @array_case.map.with_index { |elem, i| elem.position = (i + 1).to_s }
  end

  # Méthode affichant le board
  def board_state
    puts "\n\t\t #{@a1.position} | #{@a2.position} | #{@a3.position}"
    puts "\t\t---+---+---"
    puts "\t\t #{@b1.position} | #{@b2.position} | #{@b3.position}"
    puts "\t\t---+---+---"
    puts "\t\t #{@c1.position} | #{@c2.position} | #{@c3.position}"
  end

  # Conditions de victoires (oui c'est très moche)
  def player1_wins(mark)
    if @a1.position == mark && @a2.position == mark && @a3.position == mark
      true

    elsif @b1.position == mark && @b2.position == mark && @b3.position == mark
      true

    elsif @c1.position == mark && @c2.position == mark && @c3.position == mark
      true

    elsif @a1.position == mark && @b1.position == mark && @c1.position == mark
      true

    elsif @a2.position == mark && @b2.position == mark && @c2.position == mark
      true

    elsif @a3.position == mark && @b3.position == mark && @c3.position == mark
      true

    elsif @a1.position == mark && @b2.position == mark && @c3.position == mark
      true

    elsif @a3.position == mark && @b2.position == mark && @c1.position == mark
      true
    else
      false
    end
  end

  def player2_wins(mark)
    if @a1.position == mark && @a2 == mark && @a3 == mark
      true
    elsif @b1.position == mark && @b2.position == mark && @b3.position == mark
      true
    elsif @c1.position == mark && @c2.position == mark && @c3.position == mark
      true
    elsif @a1.position == mark && @b1.position == mark && @c1.position == mark
      true
    elsif @a2.position == mark && @b2.position == mark && @c2.position == mark
      true
    elsif @a3.position == mark && @b3.position == mark && @c3.position == mark
      true
    elsif @a1.position == mark && @b2.position == mark && @c3.position == mark
      true
    elsif @a3.position == mark && @b2.position == mark && @c1.position == mark
      true
    else
      false
    end
  end
end