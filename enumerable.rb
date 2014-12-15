module Enumerable
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i += 1
		end
		self
	end

	def my_select
		result = []
		self.my_each { |n| result.push(n) if yield(n) == true }
		result
	end

	def my_all?
		self.my_each { |n| return false if yield(n) == false }
		true
	end

	def my_any?
		self.my_each { |n| return true if yield(n) == true }
		false
	end

	def my_none?
		self.my_each { |n| return false if yield(n) == true }
		true
	end

	def my_count(arg = {}, &block)
		c = 0
		self.each do |n|
			if block_given? 
				c +=1 if yield(n) == true
			elsif arg.is_a? Numeric
				c +=1 if arg == n
			else
				c += 1
			end
		end
		c
	end

	def my_map
		result = []
		self.my_each { |n| result << yield(n) }
		result
	end

	def my_inject(total = 0)
		self.each do |n| 
			break if n == nil
			total = yield total, n
		end
		total
	end

	def multiply_els
		self.my_inject(1) { |x, y| x * y}
	end
	
	def my_map_proc
		result = []
		self.my_each { |n| result << proc.call(n) }
		result
	end

	def my_map_both(proc = false)
		result = []
		self.my_each do |n|		
			if block_given? && proc
				result << proc.call(yield(n)) 
			elsif proc
				result << proc.call(n)
			end
		end
		result
	end

end


puts [1, 2, 3, 4].my_each { |x| x }
puts [1, 2, 3, 4].my_each_with_index { |x, y| puts x, y }
puts [1, 2, 3, 4].my_select { |x| x % 2 == 0 }
puts [1, 2, 3, 4].my_all? { |x| x % 2 == 0 }
puts [1, 2, 3, 4].my_any? { |x| x % 2 == 0 }
puts [1, 2, 3, 4].my_none? { |x| x % 2 == 0 }
puts [1, 2, 3, 4, 2, 2].my_count
puts [1, 2, 3, 4].my_map { |x| x * 2 }
puts [1, 2, 3, 4].my_inject(100) { |x, y| x + y }
puts [2, 4, 5].multiply_els

my_proc = Proc.new { |x| x * 3 }
puts [1, 2, 3, 4].my_map_proc(&my_proc)
puts [1, 2, 3, 4].my_map_both(my_proc) { |y| y * 2 }
puts [1, 2, 3, 4].my_map_both(my_proc)
puts [1, 2, 3, 4].my_map_both { |y| y * 2 }