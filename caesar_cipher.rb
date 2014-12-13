def caesar_cipher(message, shift)
	shift = shift.remainder(26) 

	message.split("").map do |letter|
		number = letter.ord

		if number >= 65 && number <= 90
			number += shift
			if number < 65
				number += 26
			elsif number > 90
				number -= 26
			end

		elsif number >= 97 && number <= 122
			number += shift
			if number < 97
				number += 26
			elsif number > 122
				number -= 26
			end
		end

		number.chr
	end
	.join
end

puts caesar_cipher("What a string!", 5)