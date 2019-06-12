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

class Location < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions

  def update_name(new_name)
    self.update(name: new_name.capitalize)
  end

  def update_category(new_category)
    self.update(category: new_category.downcase)
  end
end