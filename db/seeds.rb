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
  "admission" => "01/01/2018",
  "photo" => "http://cdn3-www.cattime.com/assets/uploads/2011/12/file_2674_himalayan-460x290-460x290.jpg"
  })

  pet1.save()

  pet2 = Animal.new({
    "name" => "Henry",
    "type" => "Dog",
    "breed" => "Japanese Akita",
    "adoptable" => "No - Training Needed",
    "admission" => "10/28/2017",
    "photo" => "https://www.hyperassur.com/wp-content/uploads/2017/07/Akita-Inu.jpg"
    })

    pet2.save()

    pet3 = Animal.new({
      "name" => "Elizabeth",
      "type" => "Cat",
      "breed" => "Bengal Cat",
      "adoptable" => "Yes",
      "admission" => "08/08/2017",
      "photo" => "https://www.pets4homes.co.uk/images/breeds/31/7711e1514d7d6665a240134a57ee13ad.jpg"
      })

      pet3.save()

      pet4 = Animal.new({
        "name" => "Victoria",
        "type" => "Dog",
        "breed" => "Shiba Inu",
        "adoptable" => "Yes",
        "admission" => "12/02/2017",
        "photo" => "https://i.imgur.com/2qEk2WZ.jpg"
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
