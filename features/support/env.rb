ENV["RACK_ENV"] = "test"

require "capybara/cucumber"
require 'awesome_print'
require_relative "../../app"

Capybara.app = TilApp

Before do
  User.delete_all
end
