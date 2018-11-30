require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({
    'name' => 'George',
    'funds' => '20'
  })

customer1.save()

customer1.name = "Sam"
customer1.update()


customer2 = Customer.new({
    'name' => 'Ann',
    'funds' => '15'
  })

customer2.save()

customer3 = Customer.new({
    'name' => 'Bob',
    'funds' => '5'
  })

customer3.save()


film1 = Film.new({
  'title' => 'Groundhog Day',
  'price' => '7'
  })

film1.save()

film1.title = 'The Royal Tenenbaums'
film1.update()

film2 = Film.new({
  'title' => 'Ghostbusters',
  'price' => '7'
  })

film2.save()

film3 = Film.new({
  'title' => 'Lost in Translation',
  'price' => '7'
  })

film3.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

ticket2.save()

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film3.id
  })

ticket3.save()


ticket3.delete()
customer3.delete()
film3.delete()

all_customers = Customer.all
all_films = Film.all
all_tickets = Ticket.all

binding.pry
nil
