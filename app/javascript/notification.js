const notification = () => {
  const notificationButton = document.getElementById("notification-btn")
  const notificationWrap = document.getElementById("notification-wrap")
  const returnButton = document.getElementById("return-btn")

  notificationButton.addEventListener('click', function() {
    notificationWrap.setAttribute("style", "display:block;")
  });

  returnButton.addEventListener('click', function() {
    notificationWrap.removeAttribute("style")
  });
};

window.addEventListener('load', notification)