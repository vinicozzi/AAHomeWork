def slow_dance(move, tiles_array)
    tiles_array.each_with_index do |tile, i|
        if tile == move 
            return i   
        end 
    end 
end 

def fast_dance(move, new_tiles_data_structure)
    new_tiles_data_structure.each { |oct_dig, dance_pos| return oct_dig if move == dance_pos }
end 


new_tiles_data_structure = { 0=>"up",1=>"right-up",2=>"right",3=>"right_down",4=>"down",5=>"left-down",6=>"left",7=>"left-up"}

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
    "left",  "left-up"]

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)