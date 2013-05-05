def foo(a)
  yield(1, 2, 3)
  puts "hello #{a}"
end

foo(9) do |a, b, c|
end

foo(8) do |a, b, c|
  puts "#{a}, #{b}, #{c}"
end

class Person
  def initialize(name)
    @name = name
  end

  def show_name()
    puts @name
  end
end

puts "-----"
s = Person.new("Soseh")
p s
s.show_name()

p Person.new('Bob')
