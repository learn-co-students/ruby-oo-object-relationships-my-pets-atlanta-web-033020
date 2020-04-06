require 'pry'

class Cat
  
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []

  def initialize(name, owner)
    #binding.pry
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end
  
  def Cat.all
    @@all
  end

end