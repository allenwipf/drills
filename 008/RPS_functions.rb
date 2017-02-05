require "pry"




	# def initialize
	# 	@p1_score = 0
	# 	@p2_score = 0
	# 	@p1 = "Player 1"
	# 	@p2 = "Player 2"
	# end

	def play

		# loop until any player has 3
		until (@p1_score == 3) or (@p2_score == 3) do
		# keep asking for a weapon until each answers a valid answer
            p1_answer = pick_weapon(@p1)
	 		until quality_control(p1_answer)
	 			p1_answer = pick_weapon(@p1)
	 		end

            p2_answer = pick_weapon(@p2)
	 		until quality_control(p2_answer)
	 			p2_answer = pick_weapon(@p2)
	 		end

	 		# tally score based on pick logic
	 		tally_score(round_win(p1_answer, p2_answer))
	 		# annouce current score
	 		annouce_score()
	 		# declare winner if there is one
	 		declare_winner()
		end
	end

 # Begin Functions

	# accounces game if there is one
	def declare_winner()
		if @p1_score >= 3
			puts
			puts "Player 1 is the champian!"
			puts "Player 1 won #{@p1_score} to #{@p2_score}"
		elsif @p2_score >= 3
			puts
			puts "Player 2 is the champian!"
			puts "Player 2 won #{@p2_score} to #{@p1_score}"
		end
	end

	def the_winner(p1_score, p2_score)
		if p1_score >= 3
			
			return "Player 1 is the champian!"
			
		elsif p2_score >= 3

			return "Player 2 is the champian!"	
		end
	end

	# Prompts player to pick a weapon and saves the results to a variable
	def pick_weapon(which_player)
		#return "#{which_player}, pick your weapon! "
		# answer = gets.chomp
		# answer = answer.downcase
	end

	# Makes sure the player enter a valid response
	def quality_control(answer)
		if answer == "cheat code"
			@p1_score = 100 - 1 
			return true
		elsif answer == "start over"
			newGame = Game.new
			# puts "Started over. Scores have been reset"
			newGame.play
		elsif answer == "rock" or answer == "scissors" or answer == "paper"
			return true
		else
			# puts "What is #{answer}? I'm not sure it's a real word."
			return false
		end	
	end

	# Winner logic. Determines who the winner is.
	def round_win(p1_answer, p2_answer)
		if p1_answer == p2_answer
			return "It's a tie! Try again!"
		elsif p1_answer == "rock" and p2_answer == "paper"
			return "Player 2 wins this round!"

		elsif p1_answer == "scissors" and p2_answer == "rock"
			return "Player 2 wins this round!"
		
		elsif p1_answer == "paper" and p2_answer == "scissors"
		 	return "Player 2 wins this round!"
		else
			return "Player 1 wins this round!"
		end

	end

	# Depending who won the round, will increment their score
	def tally_score(winner)
		if winner == "Player 1 wins this round!"
			# @p1_score += 1
			return "p1"
		elsif winner == "It's a tie! Try again!"

		else
			# @p2_score += 1
			return "p2"
		end
	end 

	# Prints the current score
	def annouce_score
		if @p1_score < @p2_score
			puts
			puts "Player 2 is in the lead with #{@p2_score} to #{@p1_score}!"
			puts
		elsif @p1_score > @p2_score
			puts
			puts "Player 1 is in the lead with #{@p1_score} to #{@p2_score}!"
			puts
		else
			puts
			puts "We have a tie! the score is #{@p1_score} to #{@p2_score}"
			puts
		end
	end


	def declare_winner()
		if @p1_score >= 3
			puts
			puts "Player 1 is the champian!"
			puts "Player 1 won #{@p1_score} to #{@p2_score}"
		elsif @p2_score >= 3
			puts
			puts "Player 2 is the champian!"
			puts "Player 2 won #{@p2_score} to #{@p1_score}"
		end
	end



