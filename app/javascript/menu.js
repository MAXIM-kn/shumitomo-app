const menu = () => {
  const menuBotton = document.getElementById("menu");
  const menuParents = document.getElementById("menu-list");
  if(!menuBotton) return null;
  menuBotton.addEventListener('click', function() {
    if (menuParents.getAttribute("style") == "display:block;") {
      menuParents.removeAttribute("style")
    } else {
      menuParents.setAttribute("style", "display:block;")
    };
  });
};


window.addEventListener('load', menu)