class Turn

  def initialize(players)
    @players = players.shuffle
    @current_player = nil
    @ennemy_player = nil
    @round = 1 
  end

  def current
    @players.select { |player| !player.dead? }.first
  end

  def next_turn
    puts "---------- Round##{@round} -----------"
    @current_player = current
    @ennemy_player = ennemy(current)
    @players.rotate!
    @round += 1
  end

  def ennemy(current)
    @players.select { |player| player != current && !player.dead?}.sample
  end

end