App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    scrollToBottom()
    return

  scrollToBottom = ->
    if $('#messages').length > 0
      messages = $('#messages')[0]
      messages.scrollTop = messages.scrollHeight
    return

  jQuery(document).on 'turbolinks:load', ->
    scrollToBottom()
    return
    # Called when there's incoming data on the websocket for this channel
