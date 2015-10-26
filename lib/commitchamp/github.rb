module Commitchamp
	class Github
		include HTTParty
	    base_uri "https://api.github.com"

    def initialize(auth_token)
		@git_auth = {
	    	"Authorization" => "token #{auth_token}",
	    	"User-Agent"    => "HTTParty"
					  }
  		@org = nil
    	@repo = nil
	end

	def prompt(message, validator)
		puts message
	  	response = gets.chomp
	  	until response =~ validator
	    	puts "Sorry, that is not a valid response. Please enter again."
	    	response = gets.chomp
	  	end
	  response
	end
	
	def fetch_bulk
		@org = prompt("What Organization would you like to see?", //)
    	@repo = prompt("Which repo in this Organization?", //)
		Github.get("/repos/#{@org}/#{@repo}/stats/contributors", headers: @git_auth)
	end


# def get_author(contribution)  this should match the layout of response.first
#    .first to help reduce amount of data
# 	 ["author"]["login"]
#
# def get_stats(contribution, stat)
# weeks = contribution["weeks"] 
# counts = weeks.map { |hash| hash[#stat]}
# .reduce look up on the enumerable docs

	end
end


