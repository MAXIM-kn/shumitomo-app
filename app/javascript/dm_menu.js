const dm_menu = () => {
  const dmMenuBotton = document.getElementById("direct-mail-menu");
  const dmMenuParents = document.getElementById("dm-menu");
  const dmIndex = document.getElementById("dm-index");
  const dmList = document.getElementById("dm-list");
  dmMenuBotton.addEventListener('click', function() {
    dmMenuParents.setAttribute("style", "display:block;")
  });
  dmIndex.addEventListener('click', function() {
    dmList.setAttribute("style", "display:block;")
  });
};

window.addEventListener('load', dm_menu)