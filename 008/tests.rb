require_relative './rock_paper_scissors.rb'
require "pry"


def define_results(expected, actual)
	if expected == actual
		 puts "Passed! Expected #{expected} and got #{actual}"
  	else
  		puts "Failed! Expected #{expected} but got #{actual}"
  	end
end


def test_sums(amount)
	test1 = AccountInfo.new
	test1.set_up_initial_values
	test1.update_tally(amount)
	define_results(test1.tally, amount)
end

# test_sums(12.0)

def round_wins(p1_answer, p2_answer)
	test1 = NewGame.new
	test1.round_win(answer1, answer2)



end

round_wins("rock", "paper")



	# Winner logic. Determines who the winner is.
	def round_win(p1_answer, p2_answer)
		if p1_answer == p2_answer
			puts "It's a tie! Try again!"
			player1()
		elsif p1_answer == "rock" and p2_answer == "paper"
			puts "Player 2 wins this round!"
			tally_score("p2")
		elsif p1_answer == "scissors" and p2_answer == "rock"
			puts "Player 2 wins this round!"
			tally_score("p2")
		elsif p1_answer == "paper" and p2_answer == "scissors"
			puts "Player 2 wins this round!"
			tally_score("p2")
		else 
			puts "Player 1 wins this round!"
			tally_score("p1")
		end
	end
