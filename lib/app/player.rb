require 'game'
class Player < Game
  attr_accessor :name, :mark

  # Méthode attribuant le nom et le symbole des deux joueurs
  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end
