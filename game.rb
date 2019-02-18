require_relative './jedi'
require_relative './turn'

class Game

  def initialize
    @jedi1 = Jedi.new('Yoda')
    @jedi2 = Jedi.new('Vador')
    @jedi3 = Jedi.new('Obiwan')
    @jedi4 = Jedi.new('Mace Windu')
    @jedis = [@jedi1, @jedi2, @jedi3, @jedi4]
    @turn = Turn.new(@jedis)
  end

  def summary
    puts 'Summary'
    puts '-----------------'
    puts @jedis.map{|jedi| jedi.status}.join("\n")
    puts '-----------------'
  end

  def game_over?
    @jedis.select { |jedi| !jedi.dead? }.count == 1
  end


  def end_game
    puts '---------- GAME OVER! ---------'
    winning_jedi = @jedis.select { |jedi| !jedi.dead?}.first

    puts "#{winning_jedi.name} has won!"

  end


  def run

    while !game_over?
      puts " "

      @turn.next_turn

      current_jedi = @turn.current
      ennemy_jedi = @turn.ennemy(current_jedi)

      puts ' '
      current_jedi.attack(ennemy_jedi)
      puts ' '
      summary
      sleep 0.5
    end
    puts ' '
    end_game
  end
end