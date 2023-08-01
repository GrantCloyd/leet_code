# @param {String} s
# @return {Integer}
def roman_to_int_naive(s)
  result = 0
  skip = false

  s.each_char.with_index do |char, indx|
      if skip == true
          skip = false
          next
      end

      if (char == 'I' || char == 'X' || char =='C') && take_next?(char, s[indx + 1])
          result += lookup((char + s[indx + 1]))
          skip =  true
      else
          result += lookup(char)
      end
  end
  result 
end

def take_next?(curr_str, next_str)
  return false if next_str.nil?
  lookup_hash = {
      'I' => ['V', 'X'],
      'X' => ['L', 'C'],
      'C' => ['D', 'M']
  }

  lookup_hash[curr_str].include?(next_str)
end

def lookup(substr)
  result_hash = {
      'I' => 1,
      'V' => 5,
      'X' => 10,
      'L' => 50,
      'C' => 100, 
      'D' => 500,
      'M' => 1000 
  }

  if substr.length > 1
      large = substr[1]
      small = substr[0]
      result_hash[large]- result_hash[small] 
  else 
      result_hash[substr]
  end
end


# far less memory, cleaner logic
def roman_to_int(s)
  hash = {
    'I'=> 1,
    'V'=> 5,
    'X'=> 10,
    'L'=> 50,
    'C'=> 100,
    'D'=> 500,
    'M'=> 1000
  }

  total = 0
  i = 0
  while i < s.length
    if i + 1 < s.length && hash[s[i]] < hash[s[i+1]]
      total += hash[s[i+1]] - hash[s[i]]
      i += 1
    else
      total += hash[s[i]]
    end

    i += 1
  end

  total
end

p roman_to_int_naive('IV')
p roman_to_int_naive('II')
p roman_to_int_naive('DCL')