class NysPrison::CLI

	def call
		list_prisons
		menu
		goodbye
	end

	def list_prisons
		puts "Welcome to the NYS prison directory"
		puts <<-DOC
			1. the first prison
			2. the second prison
		DOC
	end

	def menu
		input = nil
		while input != "exit"
			puts "Enter the number of the prison you would like more info or type list to see more prisons or type exit:"
			input = gets.strip.downcase
			case input
			when "1"
				puts "more info on prison 1..."
			when "2"
				puts "more info on prison 2..."
			when "list"
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