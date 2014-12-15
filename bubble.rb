def bubble_sort_by(array)
	array.each_with_index.map do |n, i|
		(i...array.size).each do |c|
			
			if array[i] > array[c]
				array[i], array[c] = array[c], array[i]
			end
		end
	end
	return array
end


bubble_sort_by(["hi","hello","hey"]) do |left,right|
    right.length - left.length
end