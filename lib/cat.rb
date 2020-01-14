class Cat
  attr_reader :name
  attr_accessor :owner, :mood 

  @@all = []

  def initialize(name, owner = nil)
    @name = name
    @owner = owner 
    @mood = "nervous"

    @@all << self 
  end 

  def self.all
    @@all
  end 

end

# Cat Instance methods initializes with a name and an Owner
# Cat Instance methods can change its owner
# Cat Instance methods can't change its name
# Cat Instance methods initializes with a nervous mood
# Cat Instance methods can change its mood
# Cat Class methods knows all the cats