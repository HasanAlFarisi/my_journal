class RandCloud < ActiveRecord::Base
	def self.generated_rand(type,id,rand)
		find_rand = self.where("types = ? AND type_id = ?", type, id).shift
		unless find_rand.blank?
			rands = find_rand.update(rand: rand)
		else
			rands = self.create({types: type, type_id: id, rand: rand})
		 	rands.save
		end
	end
end
