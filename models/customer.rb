require_relative("../db/sql_runner")
require_relative("./film.rb")
require_relative("./ticket.rb")
require_relative("./customer.rb")

class Customer

attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers
    (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all()
      sql = "SELECT * FROM customers"
      customers = SqlRunner.run(sql)
      result = customers.map {|customer| Customer.new(customer)}
      return result
    end

    def delete()
      sql = "DELETE FROM customers WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2)
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.*
    FROM films INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    film_array = SqlRunner.run(sql,values)
    films = film_array.map {|film_hash| Film.new(film_hash)}
    return films
  end

  def decrease_funds(ticket_price)
    new_funds = @funds.to_i - ticket_price
    @funds = new_funds.to_s
    return @funds
  end

  def buy_ticket(ticket_price)
    decrease_funds(ticket_price)
    sql = "UPDATE customers SET funds = $1 WHERE id = $2"
    values = [@funds, @id]
    SqlRunner.run(sql, values)
  end

def tickets_bought()
  return films.count
end



end
