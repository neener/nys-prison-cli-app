class NysPrison::Prison

	attr_accessor :name, :location, :url

	@@all = []

	def initialize(name=nil, location=nil, url=nil)
		@name = name
		@location = location
		@url = url
		@@all << self
	end

	def self.all
		@@all
	end

	def self.scrape_wiki
		doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_New_York_state_prisons"))
		results = doc.search(".div-col ul li a").map(&:text)
		results.each do |prison|
			self.new(prison)
		end
	end

end