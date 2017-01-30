name_to_print, *second_arg = ARGV
require 'pry'
require 'csv'



class Outflow

	def set_value(value_from_csv)

		@value = value_from_csv.gsub(/[^\d\.]/, '').to_f

    end

    def to_f

        return @value.to_f

    end

end


class Inflow

	def set_value(value_from_csv)

		@value = value_from_csv.gsub(/[^\d\.]/, '').to_f

	end

    def to_f

    	return @value.to_f

    end

end



class Account


	def doesnt_exist(account)

		accounts[account] == nil
	end

	def set_initial_value

		@tally = 0.00
		@categories = {}
	
	end

	def update_tally(transaction_ammount)

    	return @tally += transaction_ammount
	end

	def doesnt_have_category(category_name)

		@categories[category_name] == nil

	end	

	def add_category(category_name)

		@categories[category_name] = Category.new
		@categories[category_name].set_initial_value

	end

	def update_category(current_account, transaction_ammount)

		@categories[current_account].update_balance(transaction_ammount)
		@categories[current_account].update_number_of_transactions(1)
		@categories[current_account].update_average_tranactions

	end	



end


class Category

	def set_initial_value

		@sum = 0.00
		@number_of_transactions = 0
		@average_transactions = 0.00

	end

	def update_balance(transaction_ammount)

		@sum += (@sum + transaction_ammount)
	end

	def update_number_of_transactions(x)

		@number_of_transactions += x
	end

	def update_average_tranactions

		@average_transactions = (@sum/@number_of_transactions)
	end

end





accounts = {}

# This loops through each row of the excel file while reading headers but not returning them
CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|

    #sets account variable to the column with header equal to "Account" and gets ride of new line
	account = row["Account"].chomp


    # This code creates the account if the account doesn't exist and adds initial values
	if  !accounts[account]
		accounts[account] = Account.new 
		current_account = accounts[account] #here something is being created. an new account is placed into the accounts hash
		current_account.set_initial_value

    else

		current_account = accounts[account]
	end	

	# This codes takes the inflow and outflow and turns them into usable data
	# by replacing the dollar signs with an empty string and turning it into a float
	outflow = Outflow.new
	outflow.set_value(row["Outflow"])

	inflow = Inflow.new
	inflow.set_value(row["Inflow"])


	transaction_ammount = inflow.to_f - outflow.to_f


	# sums tally per account
	current_account.update_tally(transaction_ammount)

	
	# This sets the current Category
    category = row["Category"].chomp


    if 

    	current_account.doesnt_have_category(category)
     	current_account.add_category(category)
		
    end	
 	
  		# Updates category balance, total transactions and average transactions
  	current_account.update_category(category, transaction_ammount)



end


 # This creates lines and spaces for printing out the spread sheet
def lineMaker(what_type, num_of, word_length)

 (what_type * (num_of - word_length))

end
binding.pry
########################################################################
#         BEGINNING OF MAIN CODE FOR FORMATTING TERMINAL               #
########################################################################


accounts.each do |name, info|

    
	# If a name is passed that is contained in the Hash then only that name will be printed. Otherwise will print both
    if accounts.key?(name_to_print)

    	if name != name_to_print then
	    next  
	    end     
	end


   	puts lineMaker("=", 60, 0)
	puts "Account: #{name}... Balance: $#{(info[:tally]).round(2)}"
	puts lineMaker("=", 60, 0)

	puts "Category #{lineMaker(" ", 20, 8)} | Total Spent  | Average Transactions"
	puts "--------------------- | -----------  | ---------------------"

	info[:categories].each do |name, info|

    	puts "#{name}#{lineMaker(" ", 21, name.length)} | $#{(info[:sum].round(2).to_s).ljust(11)} |$#{info[:average_transactions].round(2)}"

 
end
  
    
end

#puts "#{((accounts["Priya"][:categories]["Allowance"][:average_transactions]).to_s).ljust(10)} l"





