require './app/models/data_mapper_setup'
class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, String
  property :title, String
  property :tag, String

  has n, :tags, :through => Resource
end
