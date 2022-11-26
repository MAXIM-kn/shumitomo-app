function messeage_post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formText = document.getElementById("content");
  });
 };
 
 window.addEventListener('load', messeage_post);