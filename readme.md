[![Code Climate](https://codeclimate.com/github/bmordan/bowling_with_coffeescript/badges/gpa.svg)](https://codeclimate.com/github/bmordan/bowling_with_coffeescript)
#10 Pin Bowling
##rendered in coffeescript
![enter image description here](http://www.julienslive.com/images/lot/6284/62841_0.jpg)

This problem I found very hard to solve. Of all the weekend challanges we were given at makers this one stumped me. However, I love the problem. I returned to it after the course, it took two days to have a basic working script.

once you have cloned the repo here is how to play with it. Load the compiled lib/bowling.js into node like this:

    Bowling = require('./lib/bowling')
    player = new Bowling()

Then play like this:

    player.add(4)
    player.add(6)
    player.score()
    10

There is no error checking this is just the core functionality. I love reading back the compiled machine generated Javascript, and really enjoy working with coffeescript. I even created a Cakefile and added a simple task to build a single bowling.js file.

Here are the passing tests:

![enter image description here](https://pbs.twimg.com/media/B4gejTYCYAAgteb.png)
