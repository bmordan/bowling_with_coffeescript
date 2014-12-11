{exec} = require 'child_process'

exerr  = (err, sout,  serr)->
  process.stdout.write err  if err
  process.stdout.write sout if sout
  process.stdout.write serr if serr

task 'make', 'concat all the coffeescript file and compile to one .js file', ->
  exec "cat src/frame.coffee src/scoringModule.coffee src/bowling.coffee | coffee --compile --stdio > lib/bowling.js", exerr
