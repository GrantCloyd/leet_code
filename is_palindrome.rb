# naive solution, do not convert to string

# @param {Integer} x
# @return {Boolean}
def is_palindrome_naive(x)
    return false if x < 0
    
    total_digits = Math.log10(x).to_i + 1
    return true if total_digits == 1
    stack = []
    midpoint = total_digits.even? ? total_digits / 2 : (total_digits / 2.0).round
    count = 0
    
    while (x != 0) do
        digit = x % 10
        x /= 10
        count += 1
        if count > midpoint 
            stack.last == digit ? stack.pop : nil
        elsif count == midpoint && total_digits.odd?
            next
        else
            stack << digit
        end
    end

    stack.empty?
end

def is_palindrome_better(x)
  return false if x < 0

  original = x
  reversed = 0

  while x > 0
    digit = x % 10
    reversed = reversed * 10 + digit
    x /= 10
  end

  original == reversed
end


p is_palindrome_naive(121) # true
p is_palindrome_naive(1) # true
p is_palindrome_naive(100000) # false
p is_palindrome_naive(-100) # false
p is_palindrome_naive(1234321) # true