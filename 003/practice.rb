require 'pry'

class Dog

	def initialize(color, age, kind)
		@color = color
		@age = age
		@kind = kind
	end

	def about(text)

		if text == "color" then
			puts @color
		elsif text == "age" then
			puts @age
		elsif text == "kind" then
			puts @kind
		else 
			puts "undefined"
		end

	end

	def specific_value(text)

		puts @text

	end

end


spike = Dog.new("brown", 22, "Doberman")

puts spike.about("age")
puts spike.about("kind")
puts spike.about("color")



