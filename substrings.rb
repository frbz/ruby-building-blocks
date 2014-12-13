def substrings(input, dictionary)
	dict = Hash[dictionary.map { |string| [string, 0] }]

	dict.each do |key, value|
		input.downcase.scan(key) { |x| dict[key] += 1 }
	end

	dict.each { |key, value| dict.delete(key) if dict[key] == 0 }

	puts dict
end


dictionary = ["below","down","go","going","horn","how","howdy",
							"it","i","low","own","part","partner","sit"]
   
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)