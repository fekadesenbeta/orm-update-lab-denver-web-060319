require_relative "../config/environment.rb"



class Student

  attr_accessor :name, :grade, :id

  def initialize(id=nil, name, grade)
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  @id = id
  @name = name
  @grade = grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      NAME TEXT,
      GRADE TEXT);
      SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS students;
      SQL
    DB[:conn].execute(sql)
  end

  def update
    sql = <<-SQL
      UPDATE students
      SET name = ?,
      grade = ?
      WHERE id = ?;
      SQL

    DB[:conn].execute(sql, self.name, self.grade, self.id)
  end


end
