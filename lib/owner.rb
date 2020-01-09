require "pry"

class Owner

attr_reader :name, :species

@@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all.push(self)
  end 
  
  def say_species
    "I am a #{@species}."
  end 
  
  def self.all 
    @@all
  end 
  
  def self.count 
    self.all.length
  end 
  
  def self.reset_all 
    self.all.clear
  end 
  
  def cats 
    Cat.all.select do |cats|
      cats.owner == self
    end 
  end 
  
  def dogs 
    Dog.all.select do |dogs|
      dogs.owner == self
    end 
  end 
  
  def buy_cat(cat_to_buy)
    cat1 = Cat.new(cat_to_buy,self)
  end 
  
  def buy_dog(dog_to_buy)
    dog1 = Dog.new(dog_to_buy,self)
  end 
  
  def walk_dogs 
    owners_dogs = dogs 
      owners_dogs.map do |doggle|
        doggle.mood = "happy"
      end 
  end 
  
  def feed_cats 
    owners_cats = cats 
      owners_cats.map do |cattle|
        cattle.mood = "happy"
      end 
  end 
  
  def sell_pets
    owners_cats = cats 
    owners_dogs = dogs
      owners_cats.map do |pet|
        pet.owner = nil 
        pet.mood = "nervous"
      end 
       owners_dogs.map do |pet|
        pet.owner = nil 
        pet.mood = "nervous"
      end 
  end 
  
  def list_pets 
    num_dogs = dogs.length
    num_cats = cats.length
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end 
  
  
end