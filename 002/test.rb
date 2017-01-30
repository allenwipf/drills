require_relative 'csvhash.rb'
require "pry"


def test_sums(amount)
	test1 = AccountInfo.new
	test1.set_up_initial_values
	test1.update_tally(amount)
	if test1.tally == amount
		puts "Pass"
	else 
		puts "Fail"
	end

end

test_sums(12.0)

def test_sums2(amount)
	test2 = Category.new
	test2.set_up_initial_values
	test2.add_transaction(amount)
	if test2.tally == amount
		puts "Pass"
	else
		puts "Fail"
	end
end

test_sums2(5.5)

def test_avgs(amt1, amt2, amt3)
	test3 = Category.new
	test3.set_up_initial_values
	test3.add_transaction(amt1)
	test3.add_transaction(amt2)
	test3.add_transaction(amt3)
	if test3.avr_trans == (amt1 + amt2 + amt3) / 3
		puts "Pass"
	else
		puts "Fail"
	end
	# binding.pry
end

test_avgs(6, 4, 8)


def test_uniq(cats)
	test4 = AccountInfo.new
	test4.set_up_initial_values
	cats.each do |each|
		if !test4.already_has_category(each)
	    	test4.add_category(each)
	  	end
    end
    
  	if test4.categories.count == cats.uniq.count
  		puts "Pass"
  	else
  		puts "Fail"
  	end
  	binding.pry
end

cats = ["egg", "egg", "dog", "egg"]

test_uniq(cats)