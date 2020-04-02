class Owner
  # code goes here

  attr_reader :name, :species, :cats, :dogs

  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
    @@count += 1
  
  end


  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all = []
    @@count = 0
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    @dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    @cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    @dogs.map do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
    @cats.map do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
    @cats = []
    @dogs = []
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end