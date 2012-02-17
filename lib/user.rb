require 'mongo_mapper'

class User
  include MongoMapper::Document

  key :name, String, :unique => true

  many :tils
end
