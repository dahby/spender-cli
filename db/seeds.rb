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

t1 = Transaction.create(user: u1, location: l1, price: 9.99)
t2 = Transaction.create(user: u1, location: l2, price: 10.99)
t3 = Transaction.create(user: u1, location: l3, price: 8.99)
t4 = Transaction.create(user: u1, location: l4, price: 6.99)
t5 = Transaction.create(user: u1, location: l5, price: 13.99)
t6 = Transaction.create(user: u1, location: l2, price: 4.99)
t7 = Transaction.create(user: u1, location: l4, price: 7.99)
t8 = Transaction.create(user: u1, location: l1, price: 2.99)
t9 = Transaction.create(user: u1, location: l4, price: 9.99)
t10 = Transaction.create(user: u1, location: l1, price: 10.99)
t11 = Transaction.create(user: u1, location: l6, price: 21.99)