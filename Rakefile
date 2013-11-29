require 'rubygems'
require 'bundler'

Bundler.require :default, :test

# require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task :environment do
  Sinatra::Application.environment = ENV['RACK_ENV'] || :development
end

require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/core_ext/module/delegation'

namespace :db do
  task :migrate => :environment do
    require './config/active_record'

    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate 'db/migrate'
  end
end

task :console => :environment do
  require './postie'
  require 'irb'
  ARGV.clear
  IRB.start
end
