window.addEventListener('load', function(){
  const menu = document.getElementById("category-menu");
  const pullDownMenu = document.getElementById("category-pull-down");

  menu.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color: white;");
  });
  menu.addEventListener("mouseout", function(){
    this.removeAttribute("style", "background-color: white;");
  });
  menu.addEventListener("click", function(){
    if (pullDownMenu.getAttribute("style") == "display:block;") {
      pullDownMenu.removeAttribute("style", "display:block;");
    } else {
      pullDownMenu.setAttribute("style", "display:block;");
    }
  });


});