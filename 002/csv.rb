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


def PerCatSpend(str1, str2)  ## Finds Sum of Out Flow for Each Catagories for Each Account

num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
			if row[3].delete("\n") == str1 && row[0].delete("\n") == str2
				num1 += row["Outflow"].gsub(/[$]/, '').to_f
			end  
	end

 	
	return(num1)

end

#Allowance("Groceries", "Sonia")





def Allowance(str1, str2)  ## Used to Find Allowance. Sums InFlow for Each Account

num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
			if row[3].delete("\n") == str1 && row[0].delete("\n") == str2
				num1 += row["Inflow"].gsub(/[^\d\.]/, '').to_f
			end  
	end

 	#print(num1)
	return(num1)

end


def eachSpent(str)  ## spent modificed for Allowance Sum

num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
			if row[0].delete("\n") == str && row[3] != "Allowance"
				num1 += row[4].gsub(/[$]/, '').to_f
				num1 -= row[5].gsub(/[$]/, '').to_f
				

			end  
	end
    #print(num1)
	return(num1)

end





def spentperson(str)  ## str is our category e.g. "Allowance"

num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		##expense = row[4].delete("\n")
			if row[3] == str
			num1 += row[4].gsub(/[$]/, '').to_f
			end  ##stackoverflow takes dollar sign substitutes with nothing
	end

	return(num1)

end







## takes name of header, finds all unique strings within that header row[num], returns an array of those strings

def csvUnique(str)
	rowArray = []
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		category = row[str].delete("\n")
		rowArray.push(category)
	end
	uniqCat = rowArray.uniq

	return(uniqCat)
end

 
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


csvUnique("Account").each do |name|


    
   if name == "Sonia"
   		
   		puts "--------------"
    	puts name
    	puts "--------------"

    	puts "Allowance was #{Allowance("Allowance", name)}"
    	puts "#{name} spent #{eachSpent(name).round(2)}"
    	puts "Balance is #{Allowance("Allowance", name).round(2) - eachSpent(name).round(2)}"
    	puts "Spent #{PerCatSpend("Groceries", name).round(2)} on Groceries"
		
		puts sArray.uniq
		
		#puts sAllow

		#print sArray

	elsif name == "Priya"
		
		puts "--------------"
    	puts name
    	puts "--------------"

    	puts "Allowance was #{Allowance("Allowance", name)}"
    	puts "#{name} spent #{eachSpent(name).round(2)}"
    	puts "Balance is #{Allowance("Allowance", name) - eachSpent(name)}"
    	puts "Spent #{PerCatSpend("Groceries", name).round(2)} on Groceries"

		puts pArray.uniq
		#puts pAllow
		#print pArray
	end
end

    
