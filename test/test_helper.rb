require 'mongo_mapper'
require "minitest/pride"
require "minitest/unit"
require "minitest/autorun"

if ENV["MONGOHQ_URL"]
  uri = URI.parse(ENV['MONGOHQ_URL'])
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  MongoMapper.database = uri.path.gsub(/^\//, '')
else
  MongoMapper.connection = Mongo::Connection.new('localhost')
  MongoMapper.database = "til"
end


