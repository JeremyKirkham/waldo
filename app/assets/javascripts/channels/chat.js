// app/assets/javascripts/channels/chat.js

//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('ChatChannel', {
  received: function(data) {
    this.appendMessage(data);
  },
  appendMessage: function(data) {
    $('#chat_loader').hide();
    var cw = $('#chat_window');
    cw.append('<div class="msg msg-waldo"><span class="blue-text text-darken-2">' + data.response.message + '</span></div>').scrollTop(cw.prop("scrollHeight"));
  }
});
