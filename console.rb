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

customer4 = Customer.new({
  'name' => 'Sally',
  'funds' => '38'
  })

customer4.save()

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
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })

ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

ticket2.save()

ticket3 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film2.id
  })

ticket3.save()

ticket4 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film2.id
  })

ticket3.delete()
customer3.delete()




all_customers = Customer.all
all_films = Film.all
all_tickets = Ticket.all

all_films = Film.all

film3.delete()
binding.pry
nil
