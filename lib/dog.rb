class Dog
  
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def self.all
    @@all
  end

  # def save
  #   @@all << self
  # end

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"

    @@all << self
  end


end