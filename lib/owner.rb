require 'pry'


class Owner
  
  attr_accessor
  attr_reader :species
  @@all = []

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def Owner.all
    @@all
  end

  def Owner.count
    @@all.count
  end
  
  def Owner.reset_all
    @@all.clear
  end

  def name
    @name
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select { | cat | cat.owner == self}
  end

  def dogs
    Dog.all.select { | dog | dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end