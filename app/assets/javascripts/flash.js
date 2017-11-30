function showFlashMessagesWithButton() {
  var flashMessages = document.querySelectorAll('.flash.js-flash-to-show');
  for (var i = 0; i < flashMessages.length; i++) {
    var flashMessage = flashMessages[i];
    flashMessage.style.opacity = 0;
    var button = document.createElement('button');
    button.innerText = '×';
    button.onclick = closeFlash;
    flashMessage.children[0].appendChild(button);
    setTimeout(function() {
      $(flashMessage).fadeTo(500, 1);
      flashMessage.classList.remove('js-flash-to-show');
    }, 500);
  }
}

function closeFlash() {
  var flashMessage = this.parentNode.parentNode;
  var flashContainer = flashMessage.parentNode;
  $(flashMessage).fadeTo(250, 0, function() {
    flashContainer.removeChild(flashMessage);
  });
}

function appendHiddenFlashMessage(flashMessage) {
  flashMessageElement.style.opacity = 0;
  document.querySelector('.flash-container').appendChild(flashMessageElement);
}

document.addEventListener('turbolinks:load', function() {
  showFlashMessagesWithButton();
});
