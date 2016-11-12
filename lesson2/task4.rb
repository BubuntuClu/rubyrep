vowels = ['a', 'e', 'i', 'o', 'u', 'y']
alhabet = {}
('a'..'z').each_with_index {|letter,index| alhabet[letter] = index+1 if vowels.include?(letter) }

puts alhabet