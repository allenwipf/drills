#!/usr/bin/env ruby 
require 'pry'
first_arg, *the_rest = ARGV

#binding pry

# conditions. checks which function to run


if first_arg == "add" then #if add is passed then add questions passed

	new_question = the_rest.join(' ')
	lineNumber = 0

elsif first_arg == "rm" then  #if rm is passed then removed line indicated

	lineNumber = the_rest.join(' ').to_i

elsif first_arg.nil? #if no arguement is passed then print each questions

	questions = File.open("/Users/Wipf/questions.txt", "r")

	questions.readlines.each_with_index do |eachLine, idx|

	print "#{idx +1}. #{eachLine}"
	
end

	questions.close
	lineNumber = 0

end
 
# if first_arg == "add" then add function

def add(new_question)


	questions = File.open("/Users/Wipf/questions.txt", "a")

	questions.puts new_question

	questions.close

end

add(new_question)

# if first_arg == "rm" then run removeLine function

def removeLine(lineNumber)
  

	lineNumber = lineNumber - 1
	newArray =  ""

	questions = File.open("/Users/Wipf/questions.txt", "r+")

		questions.readlines.each_with_index do |eachLine, idx|

			if idx != lineNumber && eachLine.delete("#{idx}\n") != "" #each line has an index and /n ; .delete("#{idx}\n")removes it
												   		 
			 	newArray += eachLine

			end
 	    end

    questions.close

 	questions = File.open("questions.txt", "w")
 	questions.puts newArray

	questions.close

end

removeLine(lineNumber)




# BELOW IS NOT PART OF PROGRAM YET!!!
#This function reads a specific line from a file and closes it
def readLine(line)
  
  line = line - 1

	questions = File.open("/Users/Wipf/questions.txt", "r")

		questions.readlines.each_with_index do |eachLine, idx|

		print eachLine if idx == line

 		end

	questions.close

end