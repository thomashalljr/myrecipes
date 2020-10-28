class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom"
  end
end
