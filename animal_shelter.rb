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
    end
end

class Client
  attr_accessor :name, :age, :gender, :kids, :num_pets
  def initialize(name, age, gender, kids, num_pets)
    @name = name
    @age = age
    @gender = gender
    @kids = kids
    @num_pets = num_pets
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

**********__________MAIN__________**********

The_Animal_Shelter = Shelter.new()
The_Animal_Shelter.clients << Client.new("Joe", 30, "male", 2, 5)
The_Animal_Shelter.clients << Client.new("Jeff", 35, "male", 3, 7)
The_Animal_Shelter.clients << Client.new("Sarah", 25, "female", 0, 1)
The_Animal_Shelter.animals << Animal.new("Milo", "cat", 5, "male", "string", true)
The_Animal_Shelter.animals << Animal.new("Scooby", "dog", 10, "male", "bone", true)
The_Animal_Shelter.animals << Animal.new("Sparky", "dog", 2, "male", "cat", false)

The_Animal_Shelter.print_animal_list()
The_Animal_Shelter.print_client_list()
The_Animal_Shelter.print_adoption_list()





