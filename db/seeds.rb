Admin::CompanyProfile.create( name: 'Sampulkreativ', address: "not yet", vission: "not yet", mission: "not yet")

#Status Journal
Admin::StatusJournal.create( name: 'New')
Admin::StatusJournal.create( name: 'Feedback')
Admin::StatusJournal.create( name: 'Rejected')
Admin::StatusJournal.create( name: 'Resolved')
Admin::StatusJournal.create( name: 'Close')
Admin::StatusJournal.create( name: 'In Progress')

#Type Journal
Admin::TypeJournal.create( name: 'Sprint' )
Admin::TypeJournal.create( name: 'Change Request' )
Admin::TypeJournal.create( name: 'Bug' )