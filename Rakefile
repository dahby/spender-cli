require_relative "./config/environment"
require "pry"
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "sinatra/activerecord/rake"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Start our console"
task :console do 
  Pry.start 
end
