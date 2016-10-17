class NysPrison::CLI

	def call
		NysPrison::Prison.scrape_wiki
		list
		menu
		goodbye
	end

	def list
		puts ""
		puts "Welcome to the NYS prison directory:"
		puts ""
		NysPrison::Prison.all.each_with_index do |prison, i|
			# binding.pry
			puts "#{i + 1}. #{prison.name}"
		end
	end

	def menu
		input = nil
		while input != "exit"
			puts ""
			puts "Enter the number of the prison you would like more detail on:"
			puts ""
			puts "Type list to see a list of prisons"
			puts ""
			puts "Type exit to leave the program"

			input = gets.strip.downcase

			if input.to_i > 0 
				the_prison = NysPrison::Prison.scrape_prison_info(input.to_i)
				puts "#{the_prison.name} - #{the_prison.location}"
				puts ""
				# puts "Capacity: #{the_prison.capacity}"
				# puts "Security Level: #{the_prison.security}"
				# puts ""
				puts "HISTORY"
				puts ""
				puts "#{the_prison.history}"
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