require_relative("../db/sql_runner")
require_relative("owners.rb")

class Animal

attr_reader :id, :admission, :name, :breed, :type
attr_accessor :adoptable, :owner_id, :photo

def initialize (options)
  @id = options["id"].to_i
  @name = options["name"]
  @type = options["type"]
  @breed = options["breed"]
  @adoptable = options["adoptable"]
  @admission = options["admission"]
  @photo = options["photo"]
  @owner_id = options ["owner_id"]
end

def save()
  sql = "INSERT INTO animals (name, type, breed, adoptable, admission, photo, owner_id) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING id;"
  values = [@name, @type, @breed, @adoptable, @admission, @photo, @owner_id]
  @id = SqlRunner.run(sql, values).first()["id"].to_i
end

def delete()
  sql = "DELETE FROM animals WHERE id = $1;"
  values = [@id]
  SqlRunner.run(sql, values)
end

def update()
  sql = "UPDATE animals SET (name, type, breed, adoptable, admission, photo, owner_id) = ($1,$2,$3,$4,$5,$6,$7) WHERE id = $8"
  values = [@name, @type, @breed, @adoptable, @admission, @photo, @owner_id, @id]
  SqlRunner.run(sql, values)
end

def owner
  sql = "SELECT * FROM owners WHERE id = $1;"
  values = [@owner_id]
  return Owner.new(SqlRunner.run(sql, values).first)
end

def self.find(id)
  sql = "SELECT * FROM animals WHERE id = $1;"
  values = [id]
  return Animal.new(SqlRunner.run(sql, values).first)
end

def self.all()
  sql = "SELECT * FROM animals;"
  list = SqlRunner.run(sql)
  return list.map { |animal| Animal.new(animal) }
end

def self.delete_all()
  sql = "DELETE FROM animals;"
  SqlRunner.run(sql)
end

end
