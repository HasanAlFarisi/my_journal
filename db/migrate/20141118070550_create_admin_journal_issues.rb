class CreateAdminJournalIssues < ActiveRecord::Migration
  def change
    create_table :admin_journal_issues do |t|
      t.integer :journal_id
      t.integer :status
      t.string :no
      t.string :title
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
