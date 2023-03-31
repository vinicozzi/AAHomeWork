# Find the longest fish in O(n log n) time. **Hint:** You saw a sorting algorithm
# that runs in O(n log n) in the [sorting complexity demo][sorting-demo] from the
# Sorting Complexity reading. Remember that Big O is classified by the dominant
# term.

def find_longest_fish(fishes)
    return fishes.first if fishes.length == 1
  
    mid = fishes.length / 2
    left_half = fishes[0...mid]
    right_half = fishes[mid..-1]
  
    left_longest = find_longest_fish(left_half)
    right_longest = find_longest_fish(right_half)
  
    if left_longest.length > right_longest.length
      left_longest
    else
      right_longest
    end
end

#O(n log n)
#merge_sort 

p find_longest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
    'fiiiissshhhhhh'])