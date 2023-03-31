
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish
# that you have found so far while stepping through the array only once.

def longest_fish(fishes)
    longest = fishes.first
  
    fishes.each do |fish|
      if fish.length > longest.length
        longest = fish
      end
    end
  
    longest
  end

  #O(n)


p longest_fish['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
    'fiiiissshhhhhh'])