require 'csv'

class Customer
  attr_reader :id
  attr_accessor :email, :address

  def initialize (id, email, address)
    @id = id
    @email = email
    @address = address
  end

  def self.all
    @customers = []
    CSV.open("./data/customers.csv", "r").each do |row|
      id = row[0].to_i
      email = row[1].to_s
      address = {
        street: row[2].to_s,
        city: row[3].to_s,
        state: row[4].to_s,
        zip: row[5].to_s
      }
      customer = Customer.new(id, email, address)
      @customers << customer
    end
    return @customers
  end

  def self.find(id)
    @customers = Customer.all
    @customers.each do |customer|
      if customer.id == id
        return customer
      end
    end
    return nil
  end
end
