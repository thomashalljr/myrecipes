// Scroll to last created chat message
function scrollToBottom() {
  if ($('#messages').length > 0) {
    var messages = $('#messages')[0];
    messages.scrollTop = messages.scrollHeight;
  }
}

function submitMessage(event) {
  event.preventDefault(); // Enter command doesn't generate new line
  $('#new_message').submit();
}

$(document).on('turbolinks:load', function() {
  // Only clear chat input of user who just created message
  $("#new_message").on("ajax:complete", function(e, data, status) {
    $('#message_content').val('');
  })
  scrollToBottom();
});

$(document).on('keypress', '[data-behavior~=message-entered]', function(event) {
  if (event.keyCode === 13) {
    submitMessage(event);
  }
});
