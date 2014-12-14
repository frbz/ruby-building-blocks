def caesar_cipher(message, shift)
	shift = shift.remainder(26) 

	message.split("").map do |letter|
		number = letter.ord

		if number >= 65 && number <= 90
			number = convert_letter(number, 65, 90, shift)
		elsif number >= 97 && number <= 122
			number = convert_letter(number, 97, 122, shift)
		end

		number.chr
	end
	.join
end

def convert_letter(number, low, high, shift)
	number += shift

	if number < low
		number += 26
	elsif number > high
		number -= 26
	else
		number
	end
end

puts caesar_cipher("What a string!", 5)