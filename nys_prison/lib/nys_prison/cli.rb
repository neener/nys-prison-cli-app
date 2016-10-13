class NysPrison::CLI

	def call
		NysPrison::Prison.scrape_wiki
		list
		menu
		goodbye
	end

	def list
		puts "Welcome to the NYS prison directory:"
		puts ""
		@prisons = NysPrison::Prison.all
		@prisons.each.with_index(1) do |prison, i|
			puts "#{i}. #{prison.name}"
		end
	end

	def print_stats
		puts "#{prison.name}"

		puts prison.stats
	end

	def menu
		input = nil
		while input != "exit"
			puts "Enter the number of the prison you would like more info or type list to see more prisons or type exit:"
			input = gets.strip.downcase


			if input.to_i > 0 
				the_prison = @prisons[input.to_i-1]
				puts "#{the_prison.name} - #{the_prison.location}"
			elsif input == "list"
				list
			else
				puts "Not sure what you want type list or exit"
			end
		end
	end

	def goodbye
		puts "Thank You Goodbye."
	end

end