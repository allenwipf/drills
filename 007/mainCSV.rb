require "sinatra"
require_relative './functions.rb'
require "pry"
require "csv"

get ("/"){

	erb :index
}

get("/sonia") {
	@sonia = AccountInfo.new
	@sonia.set_up_initial_values
	@sonia.build_report(@sonia, "Sonia")

	@name = "Sonia"
	@balance = @sonia.pretty_tally
	erb :sonia
}


get("/priya") {
	@priya = AccountInfo.new
	@priya.set_up_initial_values
	@priya.build_report(@priya, "Priya")

	@name = "Priya"
	@balance = @priya.pretty_tally
	erb :priya
}

get("/full") {
	@sonia = AccountInfo.new
	@sonia.set_up_initial_values
	@sonia.build_report(@sonia, "Sonia")

	@name1 = "Sonia"
	@balance1 = @sonia.pretty_tally
	
	@priya = AccountInfo.new
	@priya.set_up_initial_values
	@priya.build_report(@priya, "Priya")

	@name2 = "Priya"
	@balance2 = @priya.pretty_tally

	erb :full
}



# def display_report(title, name_string)

# 	title = AccountInfo.new
# 	title.set_up_initial_values
# 	title.build_report(title, name_string)

# 	title = name_string
# 	@balance = title.pretty_tally
	
# end




