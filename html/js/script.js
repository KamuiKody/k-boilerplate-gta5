function showUI() {
  $('body').css('display', 'flex');
}

function closeUI() {
  $('body').css('display', 'none');
}

window.addEventListener("keydown", function(event) {
  switch(event.key) {
    case "Escape":
      $.post(`https://${GetCurrentResourceName()}/Close`);
      closeUI();
    break;
  }
});
  
  window.addEventListener('message', function(event) {
  switch(event.data.listener) {
    case "open":
      showUI();
    break;
  }
});