require "pry"
require_relative './cat.rb'
require_relative './dog.rb'

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name,species="human")
    @name = name
    @species = species

    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats 
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_string)
    Cat.new(cat_string,self)
  end

  def buy_dog(dog_string)
    Dog.new(dog_string,self)
  end 

  def walk_dogs
    self.dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.map do |cat|
      cat.mood = "happy"
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
    "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

end