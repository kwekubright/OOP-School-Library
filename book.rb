require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def title
    @title
  end

  def author
    @author
  end

  def add_rental
    @rentals.push(rental)
  end

end
