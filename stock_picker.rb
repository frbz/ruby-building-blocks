def stock_picker(input)
	profit = 0
	buy = 0
	sell = 0

	input.each.with_index do |price, day|
		highprice = 0
		sellon = 0
		
		(day...input.size).each do |counter|
			if price < input[counter] && input[counter] > highprice
				highprice = input[counter]
				sellon = counter
			end
		end

		if (highprice - price) > profit
			profit = (highprice - price)
			buy = day
			sell = sellon
		end	
		
	end
	puts "Buy stocks on day #{buy} and sell them again on day #{sell} for a profit off $#{profit}!"
end


stock_picker([17,3,6,9,15,8,6,1,10])