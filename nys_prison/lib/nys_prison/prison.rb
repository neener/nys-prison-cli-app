class NysPrison::Prison

	attr_accessor :name, :location, :url

	@@all = []

	def initialize(url = nil)
		@url = url
		@name = name
		@location = location
		# get_name_and_location_from_url
	end

	def name

	end

	# def get_name_and_location_from_url
	# 	# do whatever you need to to scrape the name and location from the URL, then set them to the @name and @location instance variables
	# 	doc = Nokogiri::HTML(doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_New_York_state_prisons")))
	# end

	def self.all
		@@all
	end

	# def self.find(id)
	# 	self.all[id-1]
	# end

	def self.scrape_wiki
		doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_New_York_state_prisons"))
		links = doc.search(".div-col ul li a")
		urls = links.map{|a| "https://en.wikipedia.org#{a.attr("href")}"}
		@@all = urls.map do |url|
			self.new(url)
		end
	end

	# def doc
	# 	@doc = Nokogiri::HTML(open(self.url))
	# end

	# write a method to scrape each individual prison page for location, capacity, level of security, history
end

# lookup what ||= or equal does
# refresh on private method