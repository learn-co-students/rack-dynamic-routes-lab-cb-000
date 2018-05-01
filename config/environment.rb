require 'bundler/setup'
Bundler.require

require_relative "../app/item.rb"
require_relative '../app/application'

run Application.new
