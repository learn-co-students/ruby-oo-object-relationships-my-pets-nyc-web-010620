class Owner
  
  attr_reader :name, :species

  @@all = []

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []

    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(cat)
    @cats << Cat.new(cat, self)
  end

  def buy_dog(dog)
    @dogs << Dog.new(dog, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    @cats.clear
    @dogs.clear

    dogs.each { |dog| dog.mood = "nervous" }
    cats.each { |cat| cat.mood = "nervous" }
    dogs.each { |dog| dog.owner = nil }
    cats.each { |cat| cat.owner = nil }
  end

  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end