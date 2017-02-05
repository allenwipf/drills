require "sinatra"
require "pry"
require_relative './RPS_functions.rb'
enable :sessions


def increment(winner)
 
	if winner == "p1"
		session["p1_total_score"] += 1
	elsif winner == "p2"
		session["p2_total_score"] += 1
	end
end

post("/start"){

	session.clear
	session["p1_picked"] = "No"
	session["show_p1_box"] = "Yes"
	session["p1_total_score"] = 0
	session["p2_total_score"] = 0
	erb :play
	redirect "/"  
}


get ("/"){

	@p1_pick = session["p1_pick"]
	@p2_pick = session["p2_pick"]
	
	@round_winner = session["round_winner"]
	session.delete("round_winner")
	session["p1_total_score"]
	session["p2_total_score"]
	@current_score = session["game_winner"]

	
	erb :play
}


post("player1") {

	if quality_control(params[:p1_pick])
		session["p1_pick"] = params[:p1_pick]
    else
    	 session["p1_pick"] = "false"
    	 @p1_pick = session["p1_pick"]   	 # binding.pry
    end

    redirect "/"
}


post ("/") {
		
    if (session["show_p1_box"] != "Yes") then

		if quality_control(params[:p2_pick])
			session["p2_pick"] = params[:p2_pick]
			session["show_p1_box"] = "Yes"
	    else 
	    	session["p2_pick"] = "try_again"
	    	redirect "/"
	    end

    elsif quality_control(params[:p1_pick])
		session["p1_pick"] = params[:p1_pick]
		session["show_p1_box"] = "No"
		redirect "/"
	else          
		session["p1_pick"] = "try_again" 
    	redirect "/" 
    		
    end

    session["round_winner"] = round_win(session["p1_pick"], session["p2_pick"])
    session["increment_score"] = tally_score(session["round_winner"])
    increment(session["increment_score"])
    session["game_winner"] = the_winner(session["p1_total_score"],session["p2_total_score"])
    redirect "/"  
}