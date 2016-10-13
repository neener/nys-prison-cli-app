class NysPrison::Prison

	attr_accessor :name, :location, :url

	def self.all
		prison_1 = self.new
		prison_1.name = "Adirondack Correctional Facility"
		prison_1.location = "Ray Brook, New York"
		prison_1.url = "https://en.wikipedia.org/wiki/Adirondack_Correctional_Facility"

		prison_2 = self.new
		prison_2.name = "Albion Correctional Facility"
		prison_2.location = "Ray Brook, New York"
		prison_2.url = "https://en.wikipedia.org/wiki/Albion_Correctional_Facility"

		[prison_1, prison_2]
	end

end