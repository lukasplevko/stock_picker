def stock_picker(stocks)
	#create all sorts of combinations
	permutations = stocks.repeated_permutation(2)

	#Remove those, which would result into a loss or 0
	#Remove those values that might be sold later than bought
	permutations = permutations.to_a.filter{ |combo| combo.first - combo.last < 0 }.filter{ |permutation|
		stocks.index(permutation.first) < stocks.index(permutation.last)
	}

	#Create a hash where the key value is the difference between  permutations
	maximal_difference = permutations.reduce(Hash.new(0)) do |hash,permutation|
		hash[permutation.last - permutation.first] = permutation
		hash
	end

	#Return the highest yield
	best_stock =  maximal_difference.max { |a, b| a<=>b  }.last

	#Show the indexes of these numbers in the original stocks array
	#
	indexes = [stocks.index(best_stock.first), stocks.index(best_stock.last)]
	p indexes

end

stock_picker([17,3,6,9,15,8,6,1,10])