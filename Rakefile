require_relative 'boot'
require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    configuration = ROM::Configuration.new(:sql, "postgres://localhost:5432/#{CONFIG['db']['name']}", CONFIG['db'])
    ROM::SQL::RakeSupport.env = configuration
  end
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  Rake::Task['db:migrate'].invoke
  t.pattern = './spec/**/*_spec.rb'
end