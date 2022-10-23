window.addEventListener('load', function(){

  const categoryBotton = document.getElementById("category");
  const categoryParents = document.getElementById("category-lists");
  categoryBotton.addEventListener('click', function() {
    searchFormBotton.removeAttribute("style", "display:flex;");
    categoryParents.setAttribute("style", "display:flex;");
  })

  const searchBotton = document.getElementById("search");
  const searchFormBotton = document.getElementById("search-form");
  searchBotton.addEventListener('click', function() {
    categoryParents.removeAttribute("style", "display:flex;");
    searchFormBotton.setAttribute("style", "display:flex;");
  })
})