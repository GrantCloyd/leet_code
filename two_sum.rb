# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

# use hash for improved speed, increased memory 
# both are O(n)
def two_sum(nums, target)
  result_hash = Hash.new()

  nums.each_with_index do |num, idx|
    if result_hash[target - num]
      return [result_hash[target - num], idx]
    else
      result_hash[num] = idx
    end 
  end
end

  
# [1,2]
p two_sum([1,5,5,11], 10)