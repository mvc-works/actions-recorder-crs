
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  Devtools $ React.createFactory $ require :actions-recorder/lib/devtools

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-avatar

  :getInitialState $ \ ()
    {}
      :path $ Immutable.List
      :core null

  :componentDidMount $ \ ()
    var
      code ":__recorder__.getCore().toJS()"
      port $ chrome.runtime.connect $ {} (:name :panel)

    port.onMessage.addListener $ \\ (msg name)
      chrome.devtools.inspectedWindow.eval code $ \\ (result error)
        if (? error)
          do
            console.log error
          do
            @setState $ {} $ :core $ Immutable.fromJS result
        , undefined

  :dispatch $ \ (actionType actionData)
    var code $ + ":window.__recorder__.dispatch('"
      , actionType ":', "
      JSON.stringify actionData
      , ":)"
    chrome.devtools.inspectedWindow.eval code $ \\ (result error)
      console.log result error

  :onPathChange $ \ (path)
    @setState $ {} (:path path)

  :renderDevtools $ \ ()
    Devtools $ {}
      :height window.innerHeight
      :core @state.core
      :path @state.path
      :onPathChange @onPathChange
      :dispatch @dispatch

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      cond (? @state.core)
        @renderDevtools
        , :loading

  :styleRoot $ \ ()
    {}
