# ## Sluggish Octopus

# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to
# all other fish lengths

def slug_oct(fishes)
        longest_fish = ''
        fishes.each_with_index do |fish1, i|
          fishes.each_with_index do |fish2, i2|
            if fish2.length > fish1.length && i2 > i
              if fish2.length > longest_fish.length
                    longest_fish = fish2 
              end 
            end
          end
        end
        longest_fish
end 

#O(n^2)


p slug_oct(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
    'fiiiissshhhhhh'])