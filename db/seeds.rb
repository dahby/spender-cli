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

User.destroy_all
Location.destroy_all
Transaction.destroy_all

u1 = User.create(username: "David")

l1 = Location.create(name: "Chipotle", category: "dining out")
l2 = Location.create(name: "Shake Shack", category: "dining out")
l3 = Location.create(name: "Which Wich", category: "dining out")
l4 = Location.create(name: "Pane Pane", category: "dining out")
l5 = Location.create(name: "Wicked Good Grinders", category: "dining out")
l6 = Location.create(name: "Bartells", category: "drug store")

t1 = Transaction.create(user: u1, location: l1, price: 9.99, purchase_date: Time.now)
t2 = Transaction.create(user: u1, location: l2, price: 10.99, purchase_date: Time.now)
t3 = Transaction.create(user: u1, location: l3, price: 8.99, purchase_date: Time.now)
t4 = Transaction.create(user: u1, location: l4, price: 6.99, purchase_date: Time.now)
t5 = Transaction.create(user: u1, location: l5, price: 13.99, purchase_date: Time.now)
t6 = Transaction.create(user: u1, location: l2, price: 4.99, purchase_date: Time.now)
t7 = Transaction.create(user: u1, location: l4, price: 7.99, purchase_date: Time.now)
t8 = Transaction.create(user: u1, location: l1, price: 2.99, purchase_date: Time.now)
t9 = Transaction.create(user: u1, location: l4, price: 9.99, purchase_date: Time.now)
t10 = Transaction.create(user: u1, location: l1, price: 10.99, purchase_date: Time.now)
t11 = Transaction.create(user: u1, location: l6, price: 21.99, purchase_date: Time.now)