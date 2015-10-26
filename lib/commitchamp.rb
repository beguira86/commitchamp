require "httparty"
require "pry"

require "commitchamp/version"
require "commitchamp/github"

module Commitchamp
  class App
    def initialize
    	@auth = nil
    	@data = {}
    end

    

    def prompt(message, validator)
	  puts message
	  response = gets.chomp
	  until response =~ validator
	    puts "Sorry, that is not a valid response. Try again."
	    response = gets.chomp
	  end
	  response
	end

def sort
	selection = prompt("How would you like to sort the data?  By (D)eletions, (C)ommits, or (A)dditions?", /^(D|C|A)$/)
	if selection == D

	elsif selection == C

	else

	end
end

	def run
    	@auth = prompt("Please enter your Github token.  It will not be visible in the code, so rest easy.", /^.{40}$/)
    	search = Github.new(@auth)
    	data = search.fetch_bulk
    	table=[]
    	data.each do |data|
    		additions = 0
    		deletions = 0
    		commits = 0
    		stats = data["weeks"]
    		stats.map do |week|
    			additions += week["a"]
    			deletions += week["d"]
      			commits += week["c"]
  			end
  			table.push ({author: data["author"]["login"], additions: additions, deletions: deletions, commits: commits})
		end  			
# RICKARDS HELP IN CLASS

#   items = [
#   { :login=>"cramer", 
#     :weeks=>[
#               {:a=>1}, 
#               {:a=>2}
#             ]
#   }, 
#   { :login=>"rickard", 
#     :weeks=>[
#               {:a=>4}, 
#               {:a=>2}
#             ]
#   }
# ]

# result=[]
# items.each do |item|
#    additions = 0
#    deltions = 0
#    commits = 0
#    weeks = item[:weeks]
#    weeks.each do |week|
#      additions += week[:a]
#      deltions += week[:d]
#      commits += week[:c]
#    end  
#    result.push({login: item[:login], additions: additions, deletions: deltions, commits: commits})
# end  

   	end

  end
end

app = Commitchamp::App.new
app.run


BRIT CLASS REVIEW
use author login key



	# def redo_advanced
	# 	answer = prompt("Would you like to view another 'REPO', a different 'ORG', or 'EXIT'?", /^(ORG|EXIT|REPO)$/)
	# 	if answer == "ORG"
	# 		return the user to change @org specifically
	# 	elsif answer == "REPO" 
	# 		return the user to @repo specifiacally
	# 	else
	# 		exit 
	# 	end
	# end

	### def redo    ****  Move this to github?  If the requirements are to sort differently OR fetch/quit, put there?
	### 	prompt("Would you like to view another list?", /^(yes|y|ye|yea)$/i)
	### end


# Running bundle exec ruby lib/commit_champ.rb should:

# Prompt the user for an auth token  - done
# Ask the user what org/repo to get data about from github  -  done
# Print a table of contributions ranked in various ways  -  in progress
# Ask the user if they'd like to fetch another or quit.  -  done-I-think
# Start by testing with a small repo like:

# kingcons/coleslaw sinatra/sinatra

# Get the list of contributions for the specified repo. Figure out how many lines the user added, deleted, and their commit count. You don't have to track contributions by week, just sum them to get a total.
   # GET /repos/:owner/:repo/stats/contributors

# Once all the contributions have been collected for a repo, offer to sort them by:

# 1) lines added 2) lines deleted 3) total lines changed 4) commits made

# Then print the commit counts in a table as below:

# ## Contributions for 'owner/repo'

# Username      Additions     Deletions     Changes
# User 1            13534          2954        6249
# User 2             6940           913        1603
# ...
# Finally, ask the user if they'd like to sort the data differently, fetch another repo, or quit.

