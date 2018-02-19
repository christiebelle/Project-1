require_relative("../db/sql_runner")
require_relative("animals.rb")


class Owner

  attr_reader :first_name, :last_name
  attr_accessor :id

  def initialize (options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name) VALUES ($1,$2) RETURNING id;"
    values = [@first_name, @last_name]
    @id = SqlRunner.run(sql, values).first()["id"].to_i
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE owners SET (first_name, last_name) = ($1,$2) WHERE id = $5"
    values = [@first_name, @last_name]
    SqlRunner.run(sql, values)
  end

  def pets()
    sql = "SELECT * FROM animals WHERE id = $1;"
    values = [@id]
    list = SqlRunner.run(sql, values)
    return list.map {|pets| Animal.new(pets)}
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1;"
    values = [id]
    return Owner.new(SqlRunner.run(sql, values).first)
  end

  def self.all()
    sql = "SELECT * FROM owners;"
    list = SqlRunner.run(sql)
    return list.map { |owner| Owner.new(owner) }
  end

  def self.delete_all()
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql)
  end

end
