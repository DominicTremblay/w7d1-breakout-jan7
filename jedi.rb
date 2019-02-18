class Jedi 

  attr_reader :name, :ap
  attr_accessor :hp

  def initialize(name)
    @name = name
    @ap = 10
    @hp = 20
  end

  def status
    "Jedi: #{@name} HP: #{self.dead? ? 'Dead' : @hp}"
  end

  def take_damage(amount)
    puts "- #{@name} is taking #{amount} points of damage!"
    @hp -= amount
  end

  def attack(ennemy_jedi)
    puts "- #{@name} is attacking #{ennemy_jedi.name}"
    damage = rand(@ap) + 1
    ennemy_jedi.take_damage(damage)
  end

  def dead?
    @hp <= 0
  end

end