class Cat
  # code goes here
  attr_reader :name, :owner
  attr_accessor :mood

  @@all = []
  @@count = 0

  def initialize(name, owner)
    @name = name
    self.owner = owner
    @mood = "nervous"
    @@all << self
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def owner=(owner)
    @owner = owner
    owner.cats << self if owner
  end

end