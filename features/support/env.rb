require "capybara/cucumber"
require_relative "../../app"

Capybara.app = TilApp

Before do
  Til.delete_all
end
