function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    console.log("ok")
    
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      console.log(XHR.response);
    };
    // e.preventDefault();
  });
};
window.addEventListener('load', post);