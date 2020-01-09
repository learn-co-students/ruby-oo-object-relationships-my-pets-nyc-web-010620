class Dog
  attr_accessor :owner, :mood, :order
  attr_reader :name

  @@all = []

  def initialize(name, owner=nil)
    @name = name
    @owner = owner
    @order = nil
    @mood = "nervous"

    @@all << self
  end

  def self.all
    @@all
  end


end