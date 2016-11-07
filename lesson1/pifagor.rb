puts "Enter the first side:"
firstS = gets.chomp.to_i

puts "Enter the second side:"
secondS = gets.chomp.to_i

if (firstS > secondS)
	maxSide = firstS
else
	maxSide = secondS
end

puts "Enter the third side:"
thirdS = gets.chomp.to_i

if (thirdS > maxSide)
	maxSide = thirdS
end

if (firstS > secondS && firstS > thirdS)
	if (firstS**2 == secondS**2 + thirdS**2)
		puts "Triangle is rectangular"
	end
end

if (secondS > firstS && secondS > thirdS)
	if (secondS**2 == firstS**2 + thirdS**2)
		puts "Triangle is rectangular"
	end
end

if (thirdS > secondS && thirdS > firstS)
	if (thirdS**2 == secondS**2 + firstS**2)
		puts "Triangle is rectangular"
	end
end

if (firstS == secondS || firstS == thirdS || secondS == thirdS)
	puts "Triangle is isosceles"
end

if (firstS == secondS && firstS == thirdS && secondS == thirdS)
	puts "Triangle is equilateral"
end
