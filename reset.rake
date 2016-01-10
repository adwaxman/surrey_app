namespace :db do 	
	desc 'reset and reseed'
	task :fix: [
		'db:reset',
		'db:seed'
		]
	  end
end
