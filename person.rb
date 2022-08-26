require 'securerandom'
require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimmer'
require_relative 'base_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age:, name: 'Unkown', parent_permission: true)
    @id = SecureRandom.uuid
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
    super
  end

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental()
    @rentals.push(rental)
  end

  private :of_age?
end
