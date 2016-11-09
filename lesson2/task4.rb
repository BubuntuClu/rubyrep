vowels = ['a', 'e', 'i', 'o', 'u', 'y']
index = 1;
alhabet = {}
('a'..'z').each do |letter|
  if (vowels.include?(letter) )
    alhabet[letter] = index
  end
  index+=1
end

puts alhabet