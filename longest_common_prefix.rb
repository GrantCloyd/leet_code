def longest_common_prefix(strs)
  return strs.first if strs.length == 1
  
  result = ""
  index = 0

  loop do
    char_by_index_arr = strs.map {|str| str[index]}
      if char_by_index_arr.first && char_by_index_arr.all? {|char| char_by_index_arr.first == char} 
        result << char_by_index_arr.first
        index += 1
      else
        return result
    end
 end
end

p longest_common_prefix(["w", "wor", ""]) # ""
p longest_common_prefix(["", ""]) # ""
p longest_common_prefix(['words', 'wordss', 'wordsz', 'wordsleymaboy'])