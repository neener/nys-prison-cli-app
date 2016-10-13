class NysPrison::Prison

	attr_accessor :name, :location, :url

	def self.all
		# scrape wiki and return prisons based on that data
		self.scrape_prisons
	end

	def self.scrape_prisons
		prisons = []

		prisons << self.scrape_wiki
		# go to wiki, find the prison
		# extract the properties
		# instantiate a prison

		prisons
	end

	def self.scrape_wiki
		doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_New_York_state_prisons"))
		
		prison = self.new
		prison.name = doc.search(".div-col ul li a").map(&:text).each do |p|
			puts p
		end
		prison

	end
end