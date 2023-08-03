# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return 0 if nums[0] > target
  return nums.length if nums[nums.length - 1] < target
  left = 0
  right = nums.length-1

  while left <= right  
      mid = left + (right-left) / 2
      if nums[mid] == target
          return mid
      end
      if nums[mid] > target
          right = mid - 1
      else
          left = mid + 1
      end
  end
  
  left
end