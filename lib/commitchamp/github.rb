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

	end
end


