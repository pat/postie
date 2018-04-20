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

task :console => :environment do
  require './postie'
  require 'irb'
  ARGV.clear
  IRB.start
end
