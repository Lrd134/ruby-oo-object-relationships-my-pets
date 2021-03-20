class Owner
  # code goes here
  attr_accessor :cat, :dog
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
  def cats
    cats = Cat.all
    found_cats = []
    cats.each do | obj |
      if obj.owner == self
        found_cats << obj
      end
    end
    found_cats
  end
  def dogs
    dogs = Dog.all
    found_dogs = []
    dogs.each do | obj |
      if obj.owner == self
        found_dogs << obj
      end
    end
    found_dogs
  end
  def buy_cat(cat)
    Cat.new(cat, self)
  end
  def buy_dog(dog)
    Dog.new(dog, self)
  end
  def walk_dogs
    dogs
    dogs.each do | obj |
      obj.mood = "happy"
    end
    dogs
  end
  def feed_cats
    cats
    cats.each do | obj |
      obj.mood = "happy"
    end
    cats
  end
  def sell_pets
    dogs.each do |obj |
      obj.mood = "nervous"
      obj.owner = nil
    end
    cats.each do |obj |
      obj.mood = "nervous"
      obj.owner = nil
    end
  end
  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.size
  end
  def self.reset_all
    @@all.clear
  end
end