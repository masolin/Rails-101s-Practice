namespace :dev do
  desc "Rebuild system"
  task :rebuild => ["tmp:clear", "log:clear", "db:reset"]
end