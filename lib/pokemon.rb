class Pokemon
  attr_accessor :id,:name,:type, :db, :hp

  def initialize(name)
    @name = name
  end

  def self.save(name,type,database_connection)
    database_connection.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name, type)
  end

  def self.find(id,database_connection)
    response = database_connection.execute("SELECT * FROM pokemon WHERE ID = ?",id)[0]
    id_, name, type, hp = response

    new(id: id_, name: name, type: type,db: db, hp: hp)
  end

  def alter_hp(num, db)
        db.execute("UPDATE pokemon SET hp = #{num}
                WHERE id = #{self.id}")
    end

end
