class NysPrison::Prison

	attr_accessor :name, :location, :url

	def self.all
		# scrape wiki and return prisons based on that data
		self.scrape_prisons
	end

	def self.scrape_prisons
		prisons = []

		# go to wiki, find the prison
		# extract the properties
		# instantiate a prison

		prisons
	end

end