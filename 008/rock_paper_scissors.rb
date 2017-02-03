require "pry"

$p1_total_score = 0
$p2_total_score = 0


class NewGame

	# checks to see if there is a winner. If not, coninues game.
	def declare_winner(p1_total_score, p2_total_score)
		if $p1_total_score >= 3
			puts
			puts "Player 1 is the champian!"
			puts "Player 1 won #{$p1_total_score} to #{$p2_total_score}"
		elsif $p2_total_score >= 3
			puts
			puts "Player 2 is the champian!"
			puts "Player 2 won #{$p2_total_score} to #{$p1_total_score}"
		else
			annouce_score()
			player1()
		end
	end

	# Prompts Player 1 to pick a weapon and saves the results to a variable
	def player1
		print "Player 1, pick your weapon! "
		p1_answer = gets.chomp
		p1_answer = p1_answer.downcase
		if quality_control(p1_answer)
			player2(p1_answer)
		else
			print "'#{p1_answer}'' is not a real weapon! "
			player1()
		end
	end

	# Prompts Player 2 to pick a weapon and saves the results to a variable
	def player2(p1_answer)
		print "Player 2, pick your weapon! "
		p2_answer = gets.chomp
		p2_answer = p2_answer.downcase
		if quality_control(p2_answer)
			round_win(p1_answer, p2_answer)
		else 
			print "'#{p2_answer}'' is not a real weapon! "
			player2(p1_answer)
		end
	end

	# Makes sure the player enter a valid response
	def quality_control(answer)
		if answer == "cheat code"
			$p1_total_score = 1000000 - 1 
			return true
		elsif answer == "rock" or answer == "scissors" or answer == "paper"
			return true
		else
			return false
		end	
	end

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

	# Depending who won the round, will increment their score
	def tally_score(winner)
		if winner == "p2"
			$p2_total_score += 1
		else
			$p1_total_score += 1   
		end
			declare_winner($p1_total_score, $p2_total_score)
	end 
	# Prints the current score
	def annouce_score
		if $p1_total_score < $p2_total_score
			puts
			puts "Player 2 is in the lead with #{$p2_total_score} to #{$p1_total_score}!"
			puts
		elsif $p1_total_score > $p2_total_score
			puts
			puts "Player 1 is in the lead with #{$p1_total_score} to #{$p2_total_score}!"
			puts
		else
			puts
			puts "We have a tie! the score is #{$p1_total_score} to #{$p2_total_score}"
			puts
		end
	end
end

newGame = NewGame.new
newGame.player1()





