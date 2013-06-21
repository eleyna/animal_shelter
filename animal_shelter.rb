class Shelter
  attr_accessor :clients, :animals
    def initialize()
      @clients = []
      @animals = []
    end

    def print_client_list()
      clients.each {|client| puts "\nClient name: " + client.name;
                             puts "Age: " + client.age.to_s;
                             puts "Gender: " + client.gender;
                             puts "Number of kids: " + client.kids.to_s;
                             puts "Number of pets: " + client.num_pets.to_s}
    end

    def print_animal_list()
      animals.each {|animal| puts "\nAnimal name: " + animal.name;
                             puts "Breed: " + animal.breed;
                             puts "Age: " + animal.age.to_s;
                             puts "Gender: " + animal.gender;
                             puts "Favorite Toy: " + animal.favorite_toy}
    end

    #puts names of animals that are available for adoption
    def print_adoption_list()
      puts "\n"
      puts "Available for adoption:"
      animals.each {|animal| puts animal.name if animal.available_to_adopt == true}
      clients.each {|client| client.animals.each {|animal|
                    puts animal.name if animal.available_to_adopt == true}}
    end

    def intake_new_animal(animal)
      animals << animal
    end
end

class Client
  attr_accessor :name, :age, :gender, :kids, :num_pets, :animals
  def initialize(name, age, gender, kids, num_pets, animals)
    @name = name
    @age = age
    @gender = gender
    @kids = kids
    @num_pets = num_pets
    @animals = animals
  end

  def give_up_animal(animal, shelter)
    animals.delete(animal)
    shelter.intake_new_animal(animal)
    @num_pets -= 1
  end
end

class Animal
  attr_accessor :name, :breed, :age, :gender, :favorite_toy, :available_to_adopt
  def initialize(name, breed, age, gender, favorite_toy, available_to_adopt)
    @name = name
    @breed = breed
    @age = age
    @gender = gender
    @favorite_toy = favorite_toy
    @available_to_adopt = available_to_adopt
  end
end

############__________MAIN__________############

animal_haven = Shelter.new()

felix_the_cat = Animal.new("Felix", "cat", 2, "male", "string", true)
sasha_the_dog = Animal.new("Sasha", "dog", 10, "female", "bone", true)
milo_the_cat = Animal.new("Milo", "cat", 5, "male", "string", true)
scooby_the_dog = Animal.new("Scooby", "dog", 10, "male", "bone", true)
sparky_the_dog = Animal.new("Sparky", "dog", 2, "male", "cat", false)

joe = Client.new("Joe", 30, "male", 2, 2, [felix_the_cat, sasha_the_dog])
jeff = Client.new("Jeff", 35, "male", 3, 0, [])
sarah = Client.new("Sarah", 25, "female", 0, 0, [])

animal_haven.clients << joe
animal_haven.clients << jeff
animal_haven.clients << sarah

animal_haven.animals << milo_the_cat
animal_haven.animals << scooby_the_dog
animal_haven.animals << sparky_the_dog

puts "\n*****************************************"
animal_haven.print_adoption_list()
puts "\n*****************************************"
puts "\nAnimals in shelter:"
animal_haven.print_animal_list()
puts "\n*****************************************"
puts "\nClient list:"
animal_haven.print_client_list()
puts ""

joe.give_up_animal(felix_the_cat, animal_haven)

puts "\n*****************************************"
animal_haven.print_adoption_list()
puts "\n*****************************************"
puts "\nAnimals in shelter:"
animal_haven.print_animal_list()
puts "\n*****************************************"
puts "\nClient list:"
animal_haven.print_client_list()
puts ""






