class Game
  attr_accessor :board, :player1, :player2, :turn_counter
  

  def initialize
    @board = Board.new
    puts "blase"
    blase = gets.chomp
    @player1 = Player.new("#{blase}", 'X')
    puts "blase 2"
    blase2 = gets.chomp
    @player2 = Player.new("#{blase2}", 'O')
    @turn_counter = 1
  end

  def game_going?
    return true if @turn_counter < 10 else return false
  end

  def case_choice(choix, player)
    if choix == "1" || choix == "2" || choix == "3" || choix == "4" || choix == "5" || choix == "6" || choix == "7" || choix == "8" || choix == "9"
      if @board.case_check(choix) == true 
        @board.board_change(choix, player.mark)
        puts @turn_counter += 1
      else
        puts "nope"
        if player == @player1
          @board.board_state
          selection_p1
        else
          @board.board_state
          selection_p2
        end
      end
    else
      puts "nope"
      if player == @player1
        @board.board_state
        selection_p1
      else
        @board.board_state
        selection_p2
      end
    end
  end

  def selection_p1
    unless game_going? == false
      puts "#{@player1.name} choisi un truc"
      choix = gets.chomp
      case_choice(choix, @player1)
    end
  end

  def selection_p2
    unless game_going? == false
      puts "#{@player2.name} choisi un truc"
      choix = gets.chomp
      case_choice(choix, @player2)
    end
  end

  def turn
    while game_going? == true
      @board.board_state
      selection_p1
      @board.board_state
      selection_p2
    end
  end

  def end
    
  end

  def perform
    turn
    self.end
  end
end

