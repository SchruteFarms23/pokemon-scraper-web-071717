require 'pry'

class Pokemon
	attr_accessor :id, :db, :type, :name

	def initialize(db)
		@db = db
		@name = db[:name]
		@type = db[:type]
		@id = db[:id]
	end

	def self.save(name,type,db)
		db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
	end

	def self.find(id,db)
		poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
		# binding.pry
		Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
	end
end
