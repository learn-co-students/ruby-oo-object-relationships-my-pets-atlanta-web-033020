class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a human."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs = Dog.all.select { |dog| dog.owner == self }
    dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats = Cat.all.select { |cat| cat.owner == self }
    cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    dogs = Dog.all.select { |dog| dog.owner == self }
    cats = Cat.all.select { |cat| cat.owner == self }
    pets = cats + dogs
    pets.each do |pet|
      pet.mood = "nervous" 
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end