class Owner
  attr_reader :name, :species 

  @@all = []

  def initialize(name)
    @name = name 
    @species = "human"

    @@all << self 
  end 

  def say_species
    "I am a #{@species}."
  end 

  def self.all
    @@all
  end 

  def self.count
    self.all.count 
  end 

  def self.reset_all
    self.all.clear 
  end 

  # returns a collection of all the cats that belong to the owner
  def cats
    Cat.all.select{|cat| cat.owner == self} 
  end 

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end 

  def buy_cat(cat)
    cat = Cat.new(cat) 
    cat.owner = self 
  end 

  def buy_dog(dog)
    dog = Dog.new(dog)
    dog.owner = self
  end 

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  # can sell all its pets, which makes them nervous and leaves them without an owner 
  def sell_pets
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end 
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil 
    end 
  end 

  def list_pets
    cat_count = self.cats.count
    dog_count = self.dogs.count
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end 
  
end

# Owner Instance methods #name can have a name
# Owner Instance methods #name cannot change owner's name
# Owner Instance methods #species initializes with species set to human
# Owner Instance methods #species can't change its species
# Owner Instance methods #say_species  can say its species
# Owner Class methods .all returns all instances of Owner that have been created
# Owner Class methods .count returns the number of owners that have been created
# Owner Class methods .reset_all can reset the owners that have been created