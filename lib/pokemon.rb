class Pokemon
  attr_accessor :id,:name,:type, :db

  def initialize(name)
    @name = name
  end

  def self.save(name,type,database_connection)
    database_connection.execute("INSERT INTO pokemon (name,type) VALUES (?, ?, )"name, type)
  end
end
