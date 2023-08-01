# @param {String} s
# @return {Boolean}

# requirements only allow for strings that are brackets of some kind
# ie string must only contain following 6 chars : {}[]()

def is_valid(s)
  return false if s.length.odd?
  stack = []

  s.each_char do |char|
    case char
      when "{"
        stack << "}"
      when "("
        stack << ")"
      when "["
        stack << "]"
      when "}", "]", ')'
        if stack.last == char 
          stack.pop 
        else
          return false
        end
    end
  end
  stack.empty?
end