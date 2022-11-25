function messeage_post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "chat_messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const item = XHR.response.chat_message;
      const html = `
      <div class="chat-message-user">
        <div class="message-user-name">
          <%= chat_message.user.nickname %>
        </div>
        <div class="message-time">
          <%= chat_message.created_at.to_s(:datetime_jp) %>
          <% wdays = ['( 日 )','( 月 )','( 火 )','( 水 )','( 木 )','( 金 )','( 土 )'] %>
          <% day = chat_message.created_at.to_s(:wday_jp) %>
          <span class="wdays"><%= wdays[day.to_i]%></span>
        </div>
      </div>
      <div class="chat-message-contents">
        <div class="messages">
          <% if chat_message.content.present? %>
            <span class="message-content" id="chat-message-contents">
              <%= chat_message.content %>
            </span>
          <% end %>
          <%= image_tag chat_message.image.variant(resize: '500x500'), class: "chat-message-image" if chat_message.image.attached? %>
        </div>
      </div>`;
    };
  });
 };
 
 window.addEventListener('load', messeage_post);