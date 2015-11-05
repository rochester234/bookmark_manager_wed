require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/tag'
require './app/models/link'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_test")
DataMapper.auto_upgrade!
DataMapper.finalize
Link.finalize
Link.auto_upgrade!
Tag.finalize
Tag.auto_upgrade!
