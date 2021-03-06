# A customer of the store
class Customer
  attr_reader :name
  
  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(movie, days_rented)
    @rentals << {'movie' => movie, 'days_rented' => days_rented}
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      this_amount = element['movie'].get_amount(element['days_rented']

      # add frequent renter points
      frequent_renter_points += 1

      # add bonus for a two day new release rental
      if element['movie'].price_code == 1 && element.days_rented > 1
          frequent_renter_points += 1
      end

      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end
