def bubble_sort(array)
	array.each_with_index.map do |n, i|
		(i...array.size).each do |c|
			if array[i] > array[c]
				array[i], array[c] = array[c], array[i]
			end
		end
	end
	return array
end

puts bubble_sort([4,3,78,2,0,2])
