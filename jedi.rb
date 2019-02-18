class Jedi


  attr_reader :name, :ap
  attr_accessor :hp

  def initialize(name)
    @name = name
    @ap = 10
    @hp = 20
  end

  # tradional setter
  # def hp=(hp)
  #   @hp = hp
  # end

  def status
    "Jedi: #{@name} HP: #{self.dead? ? "is a force ghost!" : @hp}"
  end

  def attack(ennemy_jedi)
    puts "#{@name} attacks #{ennemy_jedi.name}"
    damage = rand(@ap) + 1
    ennemy_jedi.take_damage(damage)
  end

  def dead?
    @hp <= -10
  end

  def take_damage(damage_amount)
    puts "#{@name} has taken #{damage_amount} points of damage!"
    @hp -= damage_amount
  end


end