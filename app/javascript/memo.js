function message (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    console.log("ok")
    
    const form = document.getElementById("form");
    console.log(form)
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      console.log(XHR.response.message);
      const item = XHR.response.message;
      const contentsArea = document.getElementById("list");
      const roomText = document.getElementById("new-message");
      // const roomImage = document.getElementById("new-image");
      const HTML = `
        <div class="article">
          ${ item.content }
        </div>`;
      contentsArea.insertAdjacentHTML("afterbegin", HTML);
      roomText.value = "";
    };
     e.preventDefault();
  });
};
window.addEventListener('load', message);