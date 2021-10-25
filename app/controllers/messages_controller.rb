class MessagesController < ApplicationController
    before_action :get_guest_email
    before_action :check_room_id

    def index
        @messages = Message.where(room_id:@room_id)
    end

    def get_guest_email
        @guest_email = params[:guest_email]
        @guest_id = User.where(email: @guest_email).pluck(:id)[0]
        # x = @guest_email.split('@')
        # @linky = x.join('%40')
    end

    def check_room_id
        @room_id = Room.where("admin_id = ? AND receiver_id = ?", current_user.id, @guest_id).or(Room.where("receiver_id = ? AND admin_id = ?", current_user.id, @guest_id))
        if @room_id.length() == 0
            id_of_room = rand.to_s[2..6].to_i
            r = Room.new(admin_id:current_user.id, receiver_id:@guest_id, room_id:id_of_room)
            r.save
            @room_id = id_of_room
        else
            @room_id = @room_id[0].room_id
        end
    end

    def create
        @message = Message.new(messages_params)
        @message.room_id = @room_id
        if @message.save
            redirect_to "messages?guest_email#{@linky}"
        else
            redirect_to
        end
    end

    private
        def messages_params
            params.require(:message).permit(:message_body)
        end
    
end
