class Filters::CrazyCaps
	def apply(input)
		input.split("").map {|letter| rand(2) == 1 ? letter.upcase : letter.downcase}.join('')
	end
end
