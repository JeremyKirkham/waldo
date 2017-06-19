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
$(document).ready(function() {
  $('#chat_text').trigger('autoresize');
  setTimeout(function(){
    $('#chat_text').focus();
  }, 200);
  setTimeout(function(){
    $('#chat_window').append('<div class="msg msg-to"><span class="blue-text text-darken-2">Hi, I\'m Waldo. What can I help you with?</span></div>');
  }, 1000);

  $('#chat_text').keydown(function(event) {
    if (event.keyCode == 13) {
      $('#chat_loader').show();
    }
  });
});
