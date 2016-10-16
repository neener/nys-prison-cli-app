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

	def scrape_prisons
		Prison.new(name, url, location)
	end

	def scrape_prison_info
		prisons_list = Prison.all
		prisons_list.each do |prison|
			binding.pry
			prison.name = doc.search("firstHeading").text
			prison.location = doc.search().text
		end
	end

	def doc
		@doc = Nokogiri::HTML(open(self.url))
	end

end

