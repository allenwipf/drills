require "pry"

p1_total_score = 0
p2_total_score = 0


class NewGame

	# def declare_winner(p1_total_score, p2_total_score)

	# 	if p1_total_score == 5

	# 		puts "Player 1 is the champian!"
	# 		puts "Player 1 won #{p1_total_score} to #{p2_total_score}"

	# 	elsif p2_total_score == 5

	# 		puts "Player 2 is the champian!"
	# 		puts "Player 2 won #{p2_total_score} to #{p1_total_score}"
		
	# 	else
	# 		annouce_score()
	# 		player1()
	# 	end

	# end

	def player1

		p1_answer = gets.chomp
		p1_answer = p1_answer.downcase
		binding.pry
		if quality_control(p1_answer)

			player2(p1_answer)

		else

			print "That is not a real weapon! "
			player1()

		end

	end

	def player2(p1_answer)

		print "Player 2, pick your weapon! "
		p2_answer = gets.chomp
		p2_answer = p2_answer.downcase
		
		if quality_control(p2_answer)

			round_win(p1_answer, p2_answer)

		else 

			print "That is not a real weapon! "
			player2(p1_answer)

		end

	end

	def quality_control(answer)

		if answer == "rock" or answer == "scissors" or answer == "paper"
			return true
		else
			return false
		end	

	end

	def round_win(p1_answer, p2_answer)

		if p1_answer == p2_answer
			puts "It's a tie! Try again!"
			tally_score(0, 1)

		elsif p1_answer == "rock" and p2_answer == "paper"
			puts "Player 2 wins this round!"
			tally_score(0, 1)

		elsif p1_answer == "scissors" and p2_answer == "rock"
			puts "Player 2 wins this round!"
			tally_score(0, 1)

		elsif p1_answer == "paper" and p2_answer == "scissors"
			puts "Player 2 wins this round!"
			tally_score(0, 1)

		else 
			puts "Player 1 wins this round!"
			tally_score(1, 0)
		end
	end

	def tally_score(p1_score, p2_score)

			p1_total_score += p1_score
			p2_total_score += p2_score   
	
			declare_winner(p1_total_score, p2_total_score)
	end 

	def annouce_score

		if p1_total_score > p2_total_score
			puts "Player 2 is in the lead with #{p1_total_score} to #{p2_total_score}!"
		elsif p1_total_score < p2_total_score
			puts "Player 1 is in the lead with #{p2_total_score} to #{p1_total_score}!"
		else
			puts "We have a tie! the score is #{p1_total_score} to #{p2_total_score}"
		end
	end

end


x = NewGame.new
x.player1()


