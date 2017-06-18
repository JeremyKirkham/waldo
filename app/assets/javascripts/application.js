// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .

function sendChat() {
  $('#chat_loader').show();
  var text = $('#chat_text').val();
  $('#chat_text').val('').focus();
  var cw = $('#chat_window');
  cw.append('<div class="msg msg-user"><span>' + text + '</span></div>').scrollTop(cw.prop("scrollHeight"));
  jQuery.ajax({
    method: "POST",
    url: '/chat_text',
    data: {text: text}
  });
}

$(document).ready(function() {
  $('#chat_text').trigger('autoresize');
  setTimeout(function(){
    $('#chat_text').focus();
  }, 200);
  setTimeout(function(){
    $('#chat_window').append('<div class="msg msg-waldo"><span class="blue-text text-darken-2">Hi, I\'m Waldo 1.0. What can I help you with?</span></div>');
  }, 1000);

  $('#chat_text').keydown(function(event) {
    if (event.keyCode == 13) {
      sendChat();
    }
  });

  $('#submit_chat').click(function(e) {
    e.preventDefault();
    sendChat();
  });
});
