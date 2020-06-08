require 'pry'
class Pokemon

  attr_accessor :name,:type,:id ,:db

  def initialize(id:,name:,type:,db:)
    @id,@name,@type,@db = id,name,type,db;
  end

  def self.save(name,type,db)
    sql=<<-SQL
       INSERT INTO pokemon (name,type) VALUES(?,?)
    SQL
    db.execute(sql,name,type)
  end

  def self.find(id,db)
   db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1",id).map do |i|
     self.new(id:i[0],name:i[1],type:i[2],db:db)
   end.first
  end
end
