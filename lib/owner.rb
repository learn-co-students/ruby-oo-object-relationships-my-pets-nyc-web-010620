class Owner
  attr_reader :species, :name

  @@all = []
 
  def initialize(name)
    @species = "human"
    @name = name
    @cat_order = 1
    @dog_order = 1
    @@all << self

  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    cats_list = Cat.all.select { |cat| cat.owner == self }
    cats_list.sort_by(&:order)
  end

  def buy_cat(name)
    new_cat = Cat.all.find { |cat| cat.name == name }
    new_cat.owner = self
    new_cat.order = @cat_order
    @cat_order += 1
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def dogs
    dogs_list = Dog.all.select { |dog| dog.owner == self }
    dogs_list.sort_by(&:order)
  end

  def buy_dog(name)
    dogs_list = Dog.all.map { |dog| dog.name }
    if dogs_list.include? name
      new_dog = Dog.all.find { |dog| dog.name == name }
      new_dog.owner = self
      new_dog.order = @dog_order
    else
      new_dog = Dog.new(name,self)
      new_dog.order = @dog_order
    end
    @dog_order += 1
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end

  def sell_pets
    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end
    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

end