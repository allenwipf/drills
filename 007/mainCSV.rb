require "sinatra"
require_relative './functions.rb'
require "pry"
require "csv"

def display_report(name_string)
    account = AccountInfo.new
    account.set_up_initial_values
    account.build_report(account, name_string)
    return account
    
end

def write_info(new_info)
	info = File.open("/Users/Wipf/Code/drills/007/accounts.csv", "a")
	info.print new_info
	info.close
end

# The code below is a "handler". "Get" is an HTTP method for getting a page ("www.website/report")
# The code block specifies what happens when users visit that page. 
# since we want to display html, which we can't do in a ruby file, we have to use a different file
# for our display which is the erb file ("report" in this case) If our ERB file contains variables, 
# they have to be defined here.

post ("/submit") {

	new_info_array = []
	new_info_array.push(params["account"],params["date"],params["payee"],params["category"],params["outflow"], params["inflow"])
	new_info = "\n" + new_info_array.join(",")
	write_info(new_info)
	
	redirect("/report?name=#{params["account"]}")

}

get ("/index"){
	erb :index
}

get("/report") {

	@name = params["name"]
	@account = display_report(@name)
	erb :report
}

get("/full") {

	@all_accounts = []
	@names = ["Sonia", "Priya"]
	@names.each do |account|
		@all_accounts.push(display_report(account))
	end

	erb :full

}





