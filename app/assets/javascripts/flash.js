document.addEventListener("turbolinks:load", function() {
  var flashContainers = document.querySelectorAll('.flash');
  flashContainers.forEach(function(obj){
    obj.style.opacity = 0;
    var button = document.createElement("button");
    button.innerText = "×";
    button.onclick = closeFlash;
    obj.children[0].appendChild(button);
    setTimeout(function(obj) {
      $(obj).fadeTo(500, 1);
    }, 500, obj);
  });
});

function closeFlash() {
  var flash = this.parentNode.parentNode;
  var flashContainer = document.querySelector('.flash-container');
  $(flash).fadeTo(250, 0, function(){
    flashContainer.removeChild(flash);
  });
}
