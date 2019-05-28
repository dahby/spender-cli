require 'bundler'
require 'sinatra/activerecord'
require 'require_all'
Bundler.require

require_all 'lib'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/spender-dev.sqlite"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

