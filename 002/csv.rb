require 'csv'
require 'pry'



## run spent for Every unique person,(e.g. sonya, priya) run spent for every unique category
##  for every unique(persons) & for every unique(categories) run spent(category) ==> [an array of arrays]

# def personCatSpent(pplArr,catArr)
# 	 pplArr.each do |person|

# 		#CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|

# 		catArr.each do |category|
# 			#CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
# 			spent(catArr[clength])
# 			clength -=

			
# 		end

# 		plength -=
# 	end

# end

##personCatSpent(csvUnique("Account"), csvUnique("Category"))






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




def Allowance(str1, str2)  ## spent modificed for Allowance Sum

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



















##spent("Rent")

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
 sAllow = []
 pAllow = []

CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
	if row[0].delete("\n") == "Sonia"
		sArray.push(row["Category"].delete("\n"))


	elsif 
		pArray.push(row["Category"].delete("\n"))

	end

#	if row[0].delete("\n") == "Sonia" && row["Category"] == "Allowance"
#		sAllow.push(row["Inflow"])
#	elsif row[0].delete("\n") == "Priya" && row["Category"] == "Allowance"
#		pAllow.push(row["Inflow"])
#	end
end


csvUnique("Account").each do |name|


    
   if name == "Sonia"
   		
   		puts "--------------"
    	puts name
    	puts "--------------"

    	puts "Allowance was #{Allowance("Allowance", name)}"
    	puts "#{name} spent #{eachSpent(name).round(2)}"
    	puts "Balance is #{Allowance("Allowance", name).round(2) - eachSpent(name).round(2)}"
		puts sArray.uniq
		#puts spent("Groceries")
		#puts sAllow

		#print sArray

	elsif name == "Priya"
		
		puts "--------------"
    	puts name
    	puts "--------------"

    	puts "Allowance was #{Allowance("Allowance", name)}"
    	puts "#{name} spent #{eachSpent(name).round(2)}"
    	puts "Balance is #{Allowance("Allowance", name) - eachSpent(name)}"

		puts pArray.uniq
		#puts pAllow
		#print pArray
	end
end

    

## balance function takes a user, all the outflow and inflow, and gives us the total sum for that user
def balance(str)

# CSV.foreach("/Users/michaelsefranek/Code/drills/002/accounts.csv", {headers: true, return_headers: false}) do |row|
# puts row["Outflow"]

# CSV.foreach("/Users/michaelsefranek/Code/drills/002/accounts.csv", {headers: true, return_headers: false}) do |row|
# puts row["Inflow"]


	return()
end

## spent function takes user, category, all the outflow sums in that category
def spent(str)

return()
end
## avg transaction takes user, category, all the outflow avgs in that category
def avg(str)

	return()
end

