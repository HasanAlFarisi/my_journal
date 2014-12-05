class Admin::JournalTeamCheck < ActiveRecord::Base
	belongs_to :journal

	def self.save_attributes(id,journals)
		journals.each do |journal|
			save_journal = self.create({journal_id: id, admin_id: journal[1][:admin_id]})
			save_journal.save
		end
	end
end
