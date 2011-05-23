require 'rubygems'
require 'bundler'

Bundler.require :default, :test

require './postie'

Postie.set :environment, :test
Postie.set :run, false
Postie.set :raise_errors, true
Postie.set :logging, false
Postie.set :views, File.dirname(__FILE__) + '/../views'
