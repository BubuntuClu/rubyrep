basket = {}
loop do
  puts "Enter the name of goods:"
  goods_name = gets.chomp.to_s

  while basket.include?(goods_name) do
    puts "there is goods with that name. Buy a new goods:"
    goods_name = gets.chomp.to_s
  end

  break if goods_name.downcase == "stop"

  puts "Enter the price of goods:"
  goods_price = gets.chomp.to_f

  puts "Enter the count of goods:"
  goods_count = gets.chomp.to_f

  basket[goods_name] = {goods_price => goods_count}
end

puts " price for each goods"

total = 0

basket.each do |name, param|
  price = param.keys[0]
  count = param[price]
  total_good = price * count
  total += total_good
  puts "goods name - #{name}; goods price - #{price};goods count - #{count};"
  puts "total price for #{name} is #{total_good}"
end
puts "-----------------"
puts "Ur basket's cost is - #{total}"