class Cat

  attr_reader :name
  attr_accessor :mood, :owner

  @@all = []

  def self.all
    @@all
  end

  # def save
  #   @@all << self
  # end

  def initialize(name, owner)
    @name = name
    @mood = "nervous"
    @owner = owner

    @@all << self
  end
end