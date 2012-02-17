require 'mongo_mapper'

if ENV["MONGOHQ_URL"]
  uri = URI.parse(ENV['MONGOHQ_URL'])
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  MongoMapper.database = uri.path.gsub(/^\//, '')
else
  MongoMapper.connection = Mongo::Connection.new('localhost')
  MongoMapper.database = "til"
end

class Til
  include MongoMapper::Document

  key(:value, String)
end
