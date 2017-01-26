require 'csv'
require 'pry'

def Allowance(str1, str2)  ## spent modificed for Allowance Sum

num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
			if row[3].delete("\n") == str1 && row[0].delete("\n") == str2
				num1 += row["Outflow"].gsub(/[$]/, '').to_f
			end  
	end

 	print(num1)
	return(num1)

end

Allowance("Groceries", "Sonia")