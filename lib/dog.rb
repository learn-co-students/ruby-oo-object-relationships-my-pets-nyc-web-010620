class Dog
  attr_accessor :owner, :mood 
  attr_reader :name 

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

# Dog Instance methods initializes with a name and an Owner
# Dog Instance methods can change its owner
# Dog Instance methods can't change its name
# Dog Instance methods initializes with a nervous mood
# Dog Instance methods can change its mood
# Dog Class methods knows all the dogs