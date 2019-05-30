class Pokemon
  attr_accessor :id,:name,:type, :db, :hp

  def initialize(name)
    @name = name
  end

  def self.save(name,type,database_connection)
    database_connection.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name, type)
  end

  def self.find(id,database_connection)
    database_connection.execute("SELECT name,type FROM pokemon WHERE ID = ?",id)[0]
    id_, name, type, hp = answer

    new(id: id_, name: name, type: type,db: db, hp: hp)
  end



end
