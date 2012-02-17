require 'mongo_mapper'

class Til
  include MongoMapper::EmbeddedDocument

  key(:value, String)
end
