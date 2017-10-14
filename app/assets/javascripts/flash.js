document.addEventListener("turbolinks:load", function() {
  showFlashesWithButton();
});

function showFlashesWithButton(){
  var flashesToShow = document.querySelectorAll('.flash.js-flash-to-show');
  flashesToShow.forEach(function(flashToShow){
    flashToShow.style.opacity = 0;
    var button = document.createElement("button");
    button.innerText = "×";
    button.onclick = closeFlash;
    flashToShow.children[0].appendChild(button);

    setTimeout(function(flashToShow) {
      $(flashToShow).fadeTo(500, 1);
      flashToShow.classList.remove('js-flash-to-show');
    }, 500, flashToShow);
  });
}

function closeFlash() {
  var flash = this.parentNode.parentNode;
  var flashContainer = document.querySelector('.flash-container');
  $(flash).fadeTo(250, 0, function(){
    flashContainer.removeChild(flash);
  });
}
