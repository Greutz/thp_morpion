class Game
  attr_accessor :board, :player1, :player2, :turn_counter
  
  # On crée un nouveau Board, récupère les pseudos des joueurs, initialise un compteur de tours
  def initialize
    @board = Board.new
    @turn_counter = 1
  end

  def players_init
    puts "\n\tJoueur 1 entre ton pseudo !"
    puts "\tTu auras les X, c'est comme ça."
    print "> "
    blase = gets.chomp
    @player1 = Player.new("#{blase}", 'X')
    puts "\n\tJoueur 2 entre ton pseudo !"
    puts "\tTu auras les O, c'est comme ça."
    print "> "
    blase2 = gets.chomp
    @player2 = Player.new("#{blase2}", 'O')
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
        puts "\n\nErreur ! \nChoisi une case libre ;)"
        if player == @player1
          @board.board_state
          selection_p1
        else
          @board.board_state
          selection_p2
        end
      end
    else
      puts "\n\nErreur ! \nChoisi un chiffre entre 1 et 9"
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
      puts "\n\nC'est au tour de #{@player1.name}, choisi sur quelle case jouer"
      print "> "
      choix = gets.chomp
      case_choice(choix, @player1)
    end
  end

  def selection_p2
    unless game_going? == false
      puts "\n\nC'est au tour de #{@player2.name}, choisi sur quelle case jouer"
      print "> "
      choix = gets.chomp
      case_choice(choix, @player2)
    end
  end

  def turn
    while game_going? == true
      @board.board_state
      selection_p1
      break if @board.player1_wins == true
      @board.board_state
      selection_p2
      break if @board.player2_wins == true
    end
  end
  
  def end
    @board.board_state
    if @board.player1_wins == true
      puts "\n\n\t\tVictoire de #{player1.name} !\n\n"
    elsif @board.player2_wins == true
      puts "\n\n\t\tVictoire de #{player2.name} !\n\n"
    else
      puts "\n\n\t\tMATCH NUL"
    end
    @board.board_wipe
    puts "\n\t\tVoulez-vous rejouer ?"
    puts "\n\t\tAppuez sur entrée pour continuer"
    puts "\n\t\tEntrez non pour quitter"
    perform if gets.chomp == "" else abort
  end

  def perform
    @turn_counter = 0
    system('clear')
    players_init
    turn
    self.end
  end
end
