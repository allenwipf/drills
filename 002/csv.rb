require 'csv'
require 'pry'

## cleans a string from money, decimal point
def scrub(str)
    return str.delete("$").delete(",").delete("\n")
end

def rowCurrencyValueToFloat(currencyString)
	return currencyString.gsub(/[^\d\.]/, '').to_f
end

## Finds Sum of Out Flow for Each Catagories for Each Account, accounting for refund
def perCatSpend(catStr, acctStr)
	totalPerAccount = 0.0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		if scrub(row["Category"]) == catStr && scrub(row["Account"]) == acctStr
			totalPerAccount -= rowCurrencyValueToFloat(row["Outflow"])
			totalPerAccount += rowCurrencyValueToFloat(row["Inflow"])
		end  
	end

	return totalPerAccount
end

## Used to Find Allowance. Sums InFlow for Each Account
def allowance(account_name)  
	allowance_total = 0.0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
		if scrub(row["Category"]) == "Allowance" && scrub(row["Account"])== account_name
			allowance_total += rowCurrencyValueToFloat(row["Inflow"])
		end  
	end

	return allowance_total
end

## for account_ name gives  total spent in everything BUT "Allowance"
def eachSpent(account_name)
	
	total_spent = 0.0
	
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
		if scrub(row["Account"]) == account_name && row["Category"] != "Allowance" 
			total_spent += rowCurrencyValueToFloat(row["Outflow"])
			total_spent -= rowCurrencyValueToFloat(row["Inflow"])			
		end  	
	end
	
	return total_spent
end

## takes a name, and counts nonzero transactions, and gives the average, and count for that Acct

def avg(account_name, category) 
	counter = 0

	arrayTrans = []

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
	
		if scrub(row["Account"]) == account_name && scrub(row["Category"]) == category

			if rowCurrencyValueToFloat(row["Outflow"]) == 0.0

				arrayTrans.push(rowCurrencyValueToFloat(row["Inflow"]))


			else 
				arrayTrans.push(- rowCurrencyValueToFloat(row["Outflow"])) 

			end

				
		end  
	
	end


	average = arrayTrans.sum  / arrayTrans.length
		


	return average.round(2)
end

## takes name of header, finds all unique strings within that header row[num], returns an array of those strings

def uniqueValuesInColumn(header_str)
	valuesArr = []
	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		value = scrub(row[header_str])
		valuesArr.push(value)
	end

	return valuesArr.uniq
end

## specific variation of csvUnique : takes an string of an account name (e.g Sonia) and prints name and all its unique accounts
def csvUniqCatForName(strAcct)
    catchArray = []
    CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
        cleanCategory = scrub(row["Category"])
        cleanAcct = scrub(row["Account"])
        if cleanAcct == strAcct
            catchArray.push(cleanCategory)
        end
    end
    uniqCat = catchArray.uniq
    return uniqCat
end

## takes a string and a number gives us a string with that number of spaces after and a divider "|"

def makeSpaceStr (csvStr , spaceNum)
	spaces = spaceNum - csvStr.length 
	spaces1 = " " * spaces 

	return print csvStr + spaces1

end

########################################################################
#         BEGINNING OF MAIN CODE FOR FORMATTING TERMINAL               #
########################################################################


uniqueValuesInColumn("Account").each do |name|

	balance = allowance(name) - eachSpent(name)
   		puts "=" * 69
    	puts "Account: #{name}... Balance: $#{balance.round(2)}"
    	puts "=" * 69
      	
      	makeSpaceStr(" Category", 30)
      	print "|"
      	makeSpaceStr(" Total Spent", 17)
      	print "|" 
      	makeSpaceStr(" Average Transaction", 22)
      	puts 
      	print "-" * 30
      	print "|"
      	print "-" * 17
      	print "|"
      	print "-" * 22
      	puts

		# display all the spend
		csvUniqCatForName(name).each do |cat|
			spentRow = perCatSpend(cat, name).round(2).to_s
			makeSpaceStr(cat, 30) 
			print "|"
			print " $"
		   	makeSpaceStr(spentRow, 15) 
		   	print "|"
		   	print " $"
		   	makeSpaceStr(avg(name, cat).to_s, 20)
		   	puts  #with average #{avg(name, cat)} #{cat.length}"		    
		end
end
