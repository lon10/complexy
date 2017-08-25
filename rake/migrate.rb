namespace :db do
  task :migrate do
    ActiveRecord::Migrator.migrate('db/migrate')
  end
end
