#!/usr/bin/env ruby 
require 'pry'
first_arg, *the_rest = ARGV

 
# if the first argument == "add" then this code appends the second argument passed to the file

def add(new_question)

	questions = File.open("/Users/Wipf/questions.txt", "a")
	questions.puts new_question
	questions.close

end

# if first_arg == "rm" then this code will open the file and copy each line into a new array unless 
# it's index matches the number passed by second_arg or is an empty line. That array is then, line 
# by line printed to the same file after it's erased. 

def removeLine(line_to_remove)
  

	line_to_remove = line_to_remove - 1
	newArray =  ""

	questions = File.open("/Users/Wipf/questions.txt", "r+")

		questions.readlines.each_with_index do |eachLine, idx|

			if idx != line_to_remove && eachLine.delete("#{idx}\n") != "" #each line has an index and /n ; .delete("#{idx}\n")removes it
												   		 
			 	newArray += eachLine

			end
 	    end

    questions.close

 	questions = File.open("/Users/Wipf/questions.txt", "w")
 	questions.puts newArray

	questions.close

end

def print(should_print)
	if file == "yes"
		questions = File.open("/Users/Wipf/questions.txt", "r")

			{questions.readlines.each_with_index do |eachLine, idx|
			print "#{idx +1}. #{eachLine}"}
			end
	end

end


#If statements that determines which functions run based on first_arg value

if first_arg == "add" then #if add is passed then add questions passed

	new_question = the_rest.join(' ')
	add(new_question)

elsif first_arg == "rm" then  #if rm is passed then removed line indicated

	line_to_remove = the_rest.join(' ').to_i
	removeLine(line_to_remove)

elsif first_arg.nil? #if no arguement is passed then print each questions

	print("yes")
	
end

	questions.close