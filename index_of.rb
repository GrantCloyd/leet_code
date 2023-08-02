# @param {String} haystack
# @param {String} needle
# @return {Integer}

# chance to practice sliding window, slightly smaller memory usage than recreating the substring each time
def index_of(haystack, needle)
  return -1 if needle.length > haystack.length

  index = 0
  substring = haystack[index...needle.length]

  while substring.length == needle.length
    return index if substring == needle
    index += 1
    substring = substring[1..]
    next_letter = haystack[(index + needle.length - 1)] 
    substring = next_letter ? substring << next_letter : break  
  end   

  -1
end

p index_of("hello", 'll')

def built_in(haystack, needle)
  haystack.index(nee)
end
