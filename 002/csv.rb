require 'csv'
require 'pry'

## spent takes an Category name (a string) and returns amount of total outflow in that Category

def spent(str)  ## str is our category e.g. "Allowance"

 	num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		##expense = row[4].delete("\n")
		if row[3] == str
			num1 += row[4].gsub(/[$]/, '').to_f
		end  ##stackoverflow takes dollar sign substitutes with nothing
	end

	return(num1)

end



def perCatSpend(str1, str2)  ## Finds Sum of Out Flow for Each Catagories for Each Account, accounting for refund

	num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
		if row[3].delete("\n") == str1 && row[0].delete("\n") == str2
			num1 += row["Outflow"].gsub(/[$]/, '').to_f
			num1 -= row["Inflow"].gsub(/[$]/, '').to_f
		end  
	end

 	
	return(num1)

end

#Allowance("Groceries", "Sonia")





def allowance(account_name)  ## Used to Find Allowance. Sums InFlow for Each Account

	allowance_total = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
		if row[3].delete("\n") == "Allowance" && row[0].delete("\n") == account_name
			allowance_total += row["Inflow"].gsub(/[^\d\.]/, '').to_f
		end  
	end

 	#print(num1)
	return(allowance_total)

end


def eachSpent(account_name)  ## spent modificed for Allowance Sum

	total_spent = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
		if row[0].delete("\n") == account_name && row[3] != "Allowance"
			total_spent += row[4].gsub(/[$]/, '').to_f
			total_spent -= row[5].gsub(/[$]/, '').to_f
		end  
	end

	return(total_spent)

end



##  Incomplete, is not useful not specific to person
## category is our category e.g. "Allowance"

def spentCategory(category)  

	total = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		##expense = row[4].delete("\n")
		if row[3] == category
			total += row[4].gsub(/[$]/, '').to_f
		end  ##stackoverflow takes dollar sign substitutes with nothing
	end

	return(total)

end







## takes name of header, finds all unique strings within that header row[num], returns an array of those strings

def uniqueValuesInColumn(header_str)
	valuesArr = []
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		value = row[header_str].delete("\n")
		valuesArr.push(value)
	end

	return(valuesArr.uniq)
end

 

 ## This gives us all of the categories for each person (not the unique categories)
 sArray = []
 pArray = []


CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
	if row[0].delete("\n") == "Sonia"
		sArray.push(row["Category"].delete("\n"))


	elsif 
		pArray.push(row["Category"].delete("\n"))

	end

end


########################################################################
#         BEGINNING OF MAIN CODE FOR FORMATTING TERMINAL               #
########################################################################


uniqueValuesInColumn("Account").each do |name|


    
   if name == "Sonia"
   		
   		puts "--------------"
    	puts "#{name}"
    	puts "--------------"

    	puts "Allowance was #{allowance(name)}"
    	puts "#{name} spent #{eachSpent(name).round(2)}"
    	puts "Balance is #{allowance(name).round(2) - eachSpent(name).round(2)}"
    	puts "Spent #{perCatSpend("Groceries", name).round(2)} on Groceries"


		# display all the spend
		sArray.uniq.each do |cat|
			if cat != "Allowance"
		     puts "Spent #{perCatSpend(cat, name).round(2)} on #{cat}          "
		    end
		end
		
		#puts sAllow

		#print sArray

	elsif name == "Priya"
		
		puts "--------------"
    	puts name
    	puts "--------------"

    	puts "Allowance was #{allowance(name)}"
    	puts "#{name} spent #{eachSpent(name).round(2)}"
    	puts "Balance is #{allowance(name) - eachSpent(name)}"
    	puts "Spent #{perCatSpend("Groceries", name).round(2)} on Groceries"

		puts pArray.uniq
		#puts pAllow
		#print pArray
	end
end

    
