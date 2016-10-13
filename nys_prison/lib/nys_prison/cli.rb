class NysPrison::CLI

	def call
		list_prisons
		menu
		goodbye
	end

	def list_prisons
		puts "Welcome to the NYS prison directory"
		@prisons = NysPrison::Prison.all
		@prisons.each.with_index(1) do |prison, i|
			puts "#{i}. #{prison.name} - #{prison.location}"
		end
	end

	def menu
		input = nil
		while input != "exit"
			puts "Enter the number of the prison you would like more info or type list to see more prisons or type exit:"
			input = gets.strip.downcase

			if input.to_i > 0 
				puts @prisons[input.to_i-1]
			elsif input == "list"
				list_prisons
			else
				puts "Not sure what you want type list or exit"
			end
		end
	end

	def goodbye
		puts "See u later gator!"
	end

end