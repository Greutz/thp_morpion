# Classe principale, crée un board, gère les tours et checke les conditions de victoire
class Game
  attr_accessor :board, :player1, :player2, :turn_counter
  
  # On crée un nouveau Board, initialise un compteur de tours pour un éventuel match nul
  def initialize
    @board = Board.new
    @turn_counter = 1
  end

  # Méthode créant les objets joueurs avec leurs pseudos et leurs symboles
  def players_init
    puts "\n\tJoueur 1 entre ton pseudo !"
    print "> "
    blase = gets.chomp
    puts "Choisi ton symbole : O ou X (majuscules)"
    print "> "
    mark = gets.chomp
    until mark == "X" || mark == "O"
      puts "O ou X en majuscules :)"
      mark = gets.chomp
    end
    @player1 = Player.new("#{blase}", mark)
  end

  def player_init_2
    puts "\n\tJoueur 2 entre ton pseudo !"
    print "> "
    blase2 = gets.chomp
    if @player1.mark == "X"
      mark2 = "O"
      @player2 = Player.new("#{blase2}", mark2)
    else
      mark2 = "X"
      @player2 = Player.new("#{blase2}", mark2)
    end
  end

  # Méthode pour match nuls
  def game_going?
    return true if @turn_counter < 10 else return false
  end

  # Méthode pour choix de la case du joueur actif, et check si la case est libre ou pas
  def case_choice(choix, player)
    # On boucle sur la demande d'input en cas de mauvaise entrée
    if choix == "1" || choix == "2" || choix == "3" || choix == "4" || choix == "5" || choix == "6" || choix == "7" || choix == "8" || choix == "9"
      # On checke si la case est libre, si elle l'est :
      if @board.case_check(choix) == true 
        # On change la dite case par le symbole du joueur actif, et on rajoute un tour au compteur
        @board.board_change(choix, player.mark)
        @turn_counter += 1
      else
        # Sinon = message d'erreur et on boucle
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

  # Méthodes gérants le choix du joueur actif, et checkant la condition de victoire
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

  # Méthode gérant les tours, on boucle tant que le compteur n'est pas à 10, et on check si victoire après chaque action
  def turn
    while game_going? == true
      @board.board_state
      selection_p1
      break if @board.player1_wins(@player1.mark) == true
      @board.board_state
      selection_p2
      break if @board.player2_wins(@player2.mark) == true
    end
  end
  
  # Méthode gérant le message de fin de partie, victoire et matchs nuls
  def end
    if @board.player1_wins(@player1.mark) == true
      @board.board_state
      puts "\n\n\t\tVictoire de #{player1.name} !\n\n"
    elsif @board.player2_wins(@player2.mark) == true
      @board.board_state
      puts "\n\n\t\tVictoire de #{player2.name} !\n\n"
    else
      puts "\n\n\t\tMATCH NUL"
    end
    # On réinitialise le board en vue d'une éventuelle nouvelle partie
    @board.board_wipe
    # On reset le compteur de tours pour les nouvelles parties
    @turn_counter = 1
    puts "\n\t\tVoulez-vous rejouer ?"
    puts "\n\t\tAppuez sur entrée pour continuer"
    puts "\n\t\tEntrez non pour quitter"
    # On relance perform si nouvelle partie, sinon on quitte le programme
    perform if gets.chomp == "" else abort
  end

  # Méthode orchestre, on efface le terminal au lancement pour le style
  def perform
    system('clear')
    players_init
    player_init_2
    turn
    self.end
  end
end
