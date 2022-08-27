require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Create a book
  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  # List all books
  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each do |book|
        puts "#{book.title} by #{book.author}"
      end
    end
  end

  # List people
  def list_people
    if @people.empty?
      puts 'No people found'
    else
      @people.each do |person|
        puts "Name: #{person.name} | Age: #{person.age} | ID: #{person.id}"
      end
    end
  end

  # Create student
  def create_student
    print 'Student Age:'
    age = gets.chomp
    print 'Student Name:'
    name = gets.chomp
    print 'Assign parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, nil, name, false)
      @people.push(student)
      puts 'Student created successfully'
    when 'y'
      student = Student.new(age, nil, name, true)
      @people.push(student)
      puts 'Student created successfully'
    end
  end

  # Create teacher
  def create_teacher
    print 'Teacher Age:'
    age = gets.chomp
    print 'Teacher Name:'
    name = gets.chomp
    print 'Teacher Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end

  # Create person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  # create rental
  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date:'
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  # List all rentals for a given person id.
  def list_rental
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == @people[person_index].id
        puts "Date: #{rental.date}, Book: #{rental.book.title}, Person: #{rental.person.name}"
      end
    end
  end
end