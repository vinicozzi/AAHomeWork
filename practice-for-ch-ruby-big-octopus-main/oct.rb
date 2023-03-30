class Octopus 

    attr_accessor :fishes 

    
        @@fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
            'fiiiissshhhhhh']

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





end 