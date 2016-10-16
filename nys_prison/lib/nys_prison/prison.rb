class NysPrison::Prison

	attr_accessor :name, :location, :url

	@@all = []

	def initialize(url = nil)
		@url = url
	end

	def self.all
		@@all
	end

	def self.find(id)
		self.all[id-1]
	end

	def self.scrape_wiki
		doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_New_York_state_prisons"))
		links = doc.search(".div-col ul li a")
		urls = links.map{|a| "https://en.wikipedia.org#{a.attr("href")}"}
		@@all = urls.map do |url|
			self.new(url)
		end
	end

	def self.scrape_prison_info(input)
		prison = NysPrison::Prison.find(input)
		doc = Nokogiri::HTML(open(prison.url))
			binding.pry
			prison.name = doc.search("h1#firstHeading").text
			# prison.location = doc.search().text
		prison
	end


end

