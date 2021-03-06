require_relative("../db/sql_runner")
require_relative("./customer.rb")
require_relative("./film.rb")
require_relative("./ticket.rb")


class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @price = options['price']
  end

  def customers()
      sql = "SELECT customers.* FROM customers
      INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1"
      values = [@id]
      customer_array = SqlRunner.run(sql, values)
      customers = customer_array.map{|customer_hash| Customer.new(customer_hash)}
      return customers
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end



  def save()
    sql = "INSERT INTO films
    (title, price)
    VALUES ($1, $2)
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1"
    values = [@id]
    customer_array = SqlRunner.run(sql, values)
    customers = customer_array.map{|customer_hash| Customer.new(customer_hash)}
    return customers
end

  def customers_seeing_film()
    return customers.count
  end

end
