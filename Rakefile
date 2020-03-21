require_relative 'boot'
require 'rom/sql/rake_task'

db_config = {
    name: 'romsample_dev',
    user: 'romsample',
    password: 'romsample',
    port: 5432,
    encoding: 'utf8'
}

namespace :db do
  task :setup do
    configuration = ROM::Configuration.new(:sql, 'postgres://localhost:5432/romsample_dev', db_config)
    ROM::SQL::RakeSupport.env = configuration
  end
end