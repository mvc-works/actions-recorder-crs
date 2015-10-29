
// learn from coquette-inspect

/*
 * agent -> **content-script.js** -> background.js -> dev tools
 */
window.addEventListener('message', function(event) {
  console.log(event)
  // Only accept messages from same frame
  if (event.source !== window) {
    return;
  }

  var message = event.data;

  // Only accept messages of correct format (our messages)
  if (typeof message !== 'object' || message === null ||
      message.source !== 'actions-recorder') {
    return;
  }

  chrome.runtime.sendMessage(message);
});
