App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    comments_heading = $("#comments-heading")[0];

    if comments_heading.textContent == "No comments yet!"
      comments_heading.textContent = "Prior Comments";

    $("#messages").prepend(data);
    # Called when there's incoming data on the websocket for this channel
