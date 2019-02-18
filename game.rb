require_relative './jedi'
require_relative './turn'

class Game

  def initialize
    @jedi1 = Jedi.new('Qui-gon Jinn')
    @jedi2 = Jedi.new('Yoda')
    @jedi3 = Jedi.new('Obiwan')
    @jedi4 = Jedi.new('Darth Maul')
    @jedis = [@jedi1, @jedi2, @jedi3, @jedi4]
    @turn = Turn.new(@jedis)
  end

  def summary
    puts 
    puts '--------- Summary ---------'
    puts "#{@jedis.map { |jedi| jedi.status}.join("\n")}" 
    puts '----------------------------'
    puts
  end

  def game_over?    
    @jedis.select { |jedi| !jedi.dead? }.count == 1
  end

  def end_game
  
    puts
    puts '------------ GAME OVER! ------------'
    winner = @jedis.select { |jedi| !jedi.dead? }.first
    puts " #{winner.name} killed everyone!"

  end

  def run

    while !game_over?

      @turn.next_turn

      current_jedi = @turn.current_player
      ennemy_jedi = @turn.ennemy_player
    
      current_jedi.attack(ennemy_jedi)

      summary
      sleep 0.5
    end

    end_game

  end


end