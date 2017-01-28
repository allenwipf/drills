class Game


	def play

		@p1_score = 0
		@p2_score = 0

		puts "\nSetting scores to 0 in the beginning:"
        puts self.inspect

		while (@p1_score < 3) && (@p2_score < 3) do

			p1 = ask_player_for_rps_weapon_choice 
			p2 = ask_player_for_rps_weapon_choice

			puts winner(p1, p2)

			puts "Score updated:"
            puts self.inspect
		end

		 puts "GAME OVER!!!!"
	end


  #This method ask a player what his weapon of choice is and 
   # "chomps" the answer
	def ask_player_for_rps_weapon_choice

		puts "What is your weapon?"
		gets.chomp.downcase

	end


	def winner(p1_choice, p2_choice)


		if (p1_choice == "scissors") && (p2_choice == "paper")

			@p1_score += 1
			return "Player 1 wins!"
		
		else

			@p2_score += 1
			return "Player 2 wins!"
			
		end
    end

end

x = Game.new
x.play


