
var
  React $ require :react
  ReactDOM $ require :react-dom

require :../style/main.css

var
  Page $ React.createFactory $ require :./app/page

ReactDOM.render (Page) (document.querySelector :#app)
