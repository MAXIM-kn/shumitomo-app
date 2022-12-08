const notification = () => {
  const bookmarkButton = document.getElementById("bookmark")
  const notificationButton = document.getElementById("notification-btn")
  const notificationWrap = document.getElementById("notification-wrap")
  const bookmarkWrap = document.getElementById("bookmark-wrap")
  const returnButton = document.getElementById("return-btn")
  const rreturnBookmarkButton = document.getElementById("return-btn-bookmark")

  notificationButton.addEventListener('click', function() {
    if (bookmarkWrap.getAttribute("style") == "display:block;") {
      bookmarkWrap.removeAttribute("style")
      notificationWrap.setAttribute("style", "display:block;")
    } else {
      notificationWrap.setAttribute("style", "display:block;")
    }
  });

  bookmarkButton.addEventListener('click', function() {
    if (notificationWrap.getAttribute("style") == "display:block;") {
      notificationWrap.removeAttribute("style")
      bookmarkWrap.setAttribute("style", "display:block;")
    } else {
      bookmarkWrap.setAttribute("style", "display:block;")
    }
  });

  returnButton.addEventListener('click', function() {
    notificationWrap.removeAttribute("style")
  });

  rreturnBookmarkButton.addEventListener('click', function() {
    bookmarkWrap.removeAttribute("style")
  });

};

window.addEventListener('load', notification)