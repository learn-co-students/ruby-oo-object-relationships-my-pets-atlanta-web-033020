class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name 
    @species = "human"
    save
  end
  def self.all 
    @@all
  end
  def self.count 
    @@all.count
  end
  def save 
    @@all << self
  end

  def say_species
   "I am a human."
  end
  def self.reset_all 
    @@all = [] 
  end

  def cats #gives array
    Cat.all.select{|cat| cat.owner == self}
    
  end
  def dogs #gives array
    Dog.all.select{|dog| dog.owner == self}
  end
  def all_pets
    my_pets = []
    my_pets << self.cats + self.dogs
    my_pets
  end
  def buy_cat(name)
    name = Cat.new(name, self)
  end
  def buy_dog(name)
    name = Dog.new(name, self)
  end
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  def feed_cats 
    self.cats.each {|cat| cat.mood = "happy"}
  end
  def sell_pets 
    self.cats.each {|pet| pet.mood = "nervous"}
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.cats.each {|pet| pet.owner = nil}
    self.dogs.each {|dog| dog.owner = nil}
  end
  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end