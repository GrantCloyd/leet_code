
# You are given a large integer represented as an integer
# array digits, where each digits[i] is the ith digit of 
# the integer. The digits are ordered from most 
# significant to least significant in left-to-right order. 
# The large integer does not contain any leading 0's.

# Increment the large integer by one and return the 
# resulting array of digits.

# helper method version without chaining

def plus_one_naive(digits)
  index = digits.length - 1
  carry, index = handle_potential_carry(digits, index)

  if carry == true
    while index >= -1 && carry == true
      if index == -1
        return digits.unshift(1)
      else
        carry, index = handle_potential_carry(digits, index)
      end
    end
  end

  digits
end

def handle_potential_carry(digits, index)
  if digits[index] == 9
      digits[index] = 0
      [true, index - 1] 
  else
      digits[index] += 1
      [false, index - 1] 
  end
end

def method_chain_one(digits)
  (digits.join.to_i + 1).to_s.split("").map(&:to_i)
end

def method_chain_two(digits_arr)
  (digits_arr.join.to_i + 1).digits.reverse
end

p plus_one_naive([9, 9])
p plus_one_naive([9, 9, 9, 9, 9])
p method_chain_one([9,9])
p method_chain_two([9,9, 9])