require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new('localhost')
MongoMapper.database = "til"

class Til
  include MongoMapper::Document

  key(:value, String)
end
