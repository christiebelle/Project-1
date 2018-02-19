require("pry-byebug")
require_relative("../models/animals")
require_relative("../models/owners")

Animal.delete_all
Owner.delete_all

pet1 = Animal.new({
  "name" => "William",
  "type" => "Cat",
  "breed" => "Himalayan Cat",
  "adoptable" => "Yes",
  "admission" => "01/01/2018"
  })

pet1.save()

pet2 = Animal.new({
  "name" => "Henry",
  "type" => "Dog",
  "breed" => "Japanese Akita",
  "adoptable" => "No - Training Needed",
  "admission" => "10/28/2017"
  })

pet2.save()

pet3 = Animal.new({
  "name" => "Elizabeth",
  "type" => "Cat",
  "breed" => "Bengal Cat",
  "adoptable" => "Yes",
  "admission" => "08/08/2017"
  })

pet3.save()

pet4 = Animal.new({
  "name" => "Victoria",
  "type" => "Dog",
  "breed" => "Shiba Inu",
  "adoptable" => "Yes",
  "admission" => "12/02/2017"
  })

pet4.save()

owner1 = Owner.new({
  "first_name" => "James",
  "last_name" => "Olsen"
  })

  owner1.save()

owner2 = Owner.new({
  "first_name" => "Lena",
  "last_name" => "Luthor"
  })

  owner2.save()

owner3 = Owner.new({
  "first_name" => "Cat",
  "last_name" => "Grant"
  })

  owner3.save()

binding pry
nil
