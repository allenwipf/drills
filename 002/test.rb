require 'csv'
require 'pry'

def eachSpent(str)  ## spent modificed for Allowance Sum

num1 = 0

	CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
		
			if row[0].delete("\n") == str && row[3] != "Allowance"
				num1 += row[4].gsub(/[$]/, '').to_f
				num1 += row[5].gsub(/[$]/, '').to_f
				

			end  
	end
    print(num1)
	return(num1)

end

eachSpent("Sonia")