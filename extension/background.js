
var onlyPort = null;

/*
 * agent -> content-script.js -> **background.js** -> dev tools
 */
chrome.runtime.onMessage.addListener(function(request, sender) {
  console.log(request, sender, onlyPort)
  if (onlyPort != null) {
    onlyPort.postMessage(request)
  }
  return true;
});

chrome.runtime.onConnect.addListener(function(port) {
  console.log('port onConnect')
  onlyPort = port
})

