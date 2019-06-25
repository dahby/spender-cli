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

class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  def update_price(new_price)
    self.update(price: new_price)
  end

  def update_location(new_location)
    self.update(location: new_location)
  end

  def update_purchase_date(day, month, year)
    new_date = Time.local(year, month, day)
    self.update(purchase_date: new_date)
  end
end