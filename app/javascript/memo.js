function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/rooms/2/messages`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = ()

  });
};
window.addEventListener('load', post);