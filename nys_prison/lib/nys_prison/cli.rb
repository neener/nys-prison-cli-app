class NysPrison::CLI

	def call
		NysPrison::Prison.scrape_wiki
		list
		menu
		puts "Thank You Goodbye."
	end

	def list
		puts ""
		puts "Welcome to the NYS prison directory:"
		puts ""
		NysPrison::Prison.all.each.with_index(1) do |prison, i|
			puts "#{i}. #{prison.name}"
		end
	end

	def menu
		input = nil
		while input != "exit"
			puts ""
			puts "Enter the number of the prison you would like more detail on:"
			puts ""
			puts "Type list to see a list of prisons."
			puts ""
			puts "Type exit to leave the program."

			input = gets.strip

			if input.to_i > 0 
				the_prison = NysPrison::Prison.find(input.to_i - 1)
				puts "#{the_prison.name} - #{the_prison.location}"
				puts ""
				puts "HISTORY"
				puts ""
				puts "#{the_prison.history}"
			else input == "list"
				list
			end
		end
	end

end