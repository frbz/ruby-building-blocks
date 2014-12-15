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

def bubble_sort_by(array)
	array.each_with_index.map do |n, i|
		(i...array.size).each do |c|
			arg = yield array[i], array[c]
			if arg < 0
				array[i], array[c] = array[c], array[i]
			end
		end
	end
	puts array
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  right.length - left.length
end