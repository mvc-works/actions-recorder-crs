
Actions Recorder Chrome Extension
----

> This project is in very early stage, with bugs.

In DevTools debugger for https://github.com/teambition/actions-recorder

### Usage

In order to use this extension, you need to first install extension.
By now you need to build code by yourself.
Notice `actions-recorder@1.6.1-alpha` is used with this project.

Then add expose global variable so content script may access:

```coffee
window.__recorder__ = recorder
```

And subscribe changes of actions-recorder, post change message:

```coffee
window.postMessage source: 'actions-recorder', kind: 'change', location.toString()
```

Open `Recorder` tab in your DevTools, try make actions to force page rerendering.
As I said there are quite some bugs.


### Develop

`extension/` holds the extension code, run these commands for html page:

```bash
# set env.dev=false in gulpfile.cirru
webpack --config webpack.min.cirru
gulp html
```

or run this to develop:

```bash
gulp html
webpack-dev-server --hot
```

for more details:

https://github.com/mvc-works/webpack-workflow

### License

MIT
