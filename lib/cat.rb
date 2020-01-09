class Cat
  attr_accessor :owner, :mood, :order
  attr_reader :name

  @@all = []

  def initialize(name,owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @order = nil

    @@all << self
  end

  def self.all
    @@all
  end

end