u1 = User.create(username: "David", pin: 1234, zip_code: 98109)

l1 = Location.create(name: "Chipotle")

t1 = Transaction.create(user: u1, location: l1, total_price: 9.99)