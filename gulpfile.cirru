
var
  gulp $ require :gulp
  sequence $ require :run-sequence
  exec $ . (require :child_process) :exec
  env $ object
    :dev false
    :main :http://localhost:8080/build/main.js
    :vendor :http://localhost:8080/build/vendor.js
    :style :http://localhost:8080/build/style.css

gulp.task :html $ \ (cb)
  var
    html $ require :./template
    fs $ require :fs
    assets
  if (not env.dev) $ do
    = assets $ require :./extension/dist/assets.json
    = env.main $ + :dist/ $ . assets.main 0
    = env.style $ + :dist/ $ . assets.main 1
    = env.vendor $ + :dist/ assets.vendor
  fs.writeFile :extension/index.html (html env) cb

gulp.task :del $ \ (cb)
  var
    del $ require :del
  del (array :build) cb
