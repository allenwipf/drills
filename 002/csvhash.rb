name_to_print, *second_arg = ARGV
require 'pry'
require 'csv'


accounts = {}

########################################################################
#                     What My Hash Has to Looks Like                   #
########################################################################

#           {Account {
#              tally, categories{ 
#                         {sum, number, average
# }
# }

########################################################################
#                                 Methods                              #
########################################################################

# This creates lines and spaces for printing out the spread sheet
def lineMaker(what_type, num_of, word_length)

 (what_type * (num_of - word_length))

end




# This loops through each row of the excel file while reading headers but not returning them
CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
    
    #sets account variable to the column with header equal to "Account" and gets ride of new line
	account = row["Account"].chomp


    # This code creates the account if the account doesn't exist and adds initial values
	if !accounts[account]
		accounts[account] =  {

		tally: 0.00,
		categories: {

		}

	 }
	end


	# This codes takes the inflow and outflow and turns them into usable data
	# by replacing the dollar signs with an empty string and turning it into a float
	outflow = row["Outflow"].gsub(/[^\d\.]/, '').to_f
	inflow = row["Inflow"].gsub(/[^\d\.]/, '').to_f
	transaction_ammount = inflow - outflow



	# sums tally per account
	current_account = accounts[account]
	current_account[:tally] += transaction_ammount


	# This sets the current Category
    category = row["Category"].chomp

    if !current_account[:categories][category]
     	 

     	current_account[:categories][category] = {

         	sum: 0.0,
         	total_transactions: 0,
         	average_transactions: 0.0


	     }
    end	
 
    #This updates total transactions per account
    current_category = current_account[:categories][category]
    current_category[:sum] += transaction_ammount
    current_category[:total_transactions] += 1


    #This gives me the number of transaction on the current account
    current_category[:average_transactions] = current_category[:sum]/current_category[:total_transactions]

end



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





