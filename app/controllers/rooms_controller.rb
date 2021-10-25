class RoomsController < ApplicationController
    def create
        flash.now[:alert] = 'Error while sending message!'

        if !check_room
            
        else
            fruits = ['apple', 'banana', 'grapes', 'oranges', 'tkxel']
            laptop = ['dell', 'hp', 'mac', 'laptop', 'mobile']
            random_number = rand.to_s[2..5]
    
            @rooms = Room.new[]
            x = Room.where(admin_id: current_user, receiver_id:)
            id_of_room = fruits.sample + '-' + laptop.sample + '-' + random_number
            redirect_to messages_path
        end
    end

    private
        def check_room
            room = Room.all
            room = room.where(admin_id: 1, receiver_id: 1)
            if room
                @chating_id = room.room_id
                return true
            else
                return false
            end
        end
        
    
end
