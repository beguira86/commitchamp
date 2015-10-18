module Commitchamp
	class Github
		include HTTParty
	    base_uri "https://api.github.com"

    def initialize(auth_token)
	  @git_auth = {
	    "Authorization" => "token #{auth_token}",
	    "User-Agent"    => "HTTParty"
				  }
	end
	
	def fetch_bulk
		Github.get("/repos/#{@org}/#{@repo}/stats/contributors", headers: @git_auth)
	end




	end
end