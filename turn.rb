class Turn


  attr_reader :current_player, :ennemy_player

  def initialize(players)
    @players = players.shuffle
    @current_player = nil
    @ennemy_player = nil
    @round = 1
  end


  def living_players
    @players.select {|player| !player.dead?}
  end

  def get_current_player
    living_players.first
  end

  def get_ennemy_player(current)
    @ennemy_player = living_players.select { |jedi| jedi != current }.first
  end

  def next_turn

    puts "--------- Round##{@round} ----------"

    @current_player = get_current_player
    @ennemy_player = get_ennemy_player(@current_player)
    @round += 1
    @players.rotate!
  end





end