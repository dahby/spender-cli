# This file is part of Spender.

# Spender is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Spender is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Spender.  If not, see <https://www.gnu.org/licenses/>.

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

