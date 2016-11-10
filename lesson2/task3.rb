new_arr = [1, 1]
while ( new_arr[-1] + new_arr[-2] <= 100) do
  new_arr << new_arr[-1] + new_arr[-2]
end

puts new_arr