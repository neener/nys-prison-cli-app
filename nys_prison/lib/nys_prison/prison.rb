class NysPrison::Prison

	attr_accessor :name, :location, :url, :history

	@@all = []

	def initialize(prison)
		prison.each do |key, value|
			self.send("#{key}=", value)
		end
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find(id)
		self.all[id]
	end

	def self.scrape_wiki
		doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_New_York_state_prisons"))
		links = doc.search(".div-col ul li a")
		urls = links.map{|a| "https://en.wikipedia.org#{a.attr("href")}"}
		urls.map do |url|
			self.scrape_prison_info(url)
		end
	end

	def self.scrape_prison_info(url)
		doc = Nokogiri::HTML(open(url))
		self.new({
			:name => doc.search("h1#firstHeading").text,
			:location => doc.search("table.infobox.vcard td.label a").text,
			:history => doc.search("p").text,
			:url => url
		})
	end

end

