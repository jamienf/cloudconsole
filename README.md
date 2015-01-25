[![Build Status](https://travis-ci.org/jamienf/cloudconsole.svg?branch=master)]
(https://travis-ci.org/jamienf/cloudconsole)
[![Code Climate](https://codeclimate.com/github/jamienf/cloudconsole.png)]
(https://codeclimate.com/github/jamienf/cloudconsole)
[![Coverage Status](https://coveralls.io/repos/jamienf/cloudconsole/badge.png)]
(https://coveralls.io/r/jamienf/cloudconsole)

Mixit is a band collaboration app utilizing the Spotify API to easily add multiple tracks to one song and listen to them all at the same time.

Here are some screenshots of Mixit
![alt tag](https://raw.github.com/jamienf/mixit/master/app/assets/images/Homepage.png)
![alt tag](https://raw.github.com/jamienf/mixit/master/app/assets/images/Bandpage.png)
![alt tag](https://raw.github.com/jamienf/mixit/master/app/assets/images/Songpage.png)

Mixit can be tried at the following URL: http://mixit.herokuapp.com

While creating mixit, I encountered a number of technical challenges. Below are a few of the larger ones I had to overcome:

```
1. Soundcloud does not allow to songs to play at the same time by default. Utilizing the API to grab the individual song ID's from the URL, I was able to create a custom iframe that allowed this functionality.

2. Once multiple tracks were added to an individual song, I needed to create a button that would play them all at the same time. This required putting all of the iframes generated from the page into an array and using jquery to trigger each play button at the same time.

3. Originally to grab the individual ID's, I would need to users to sent a link from an obscure position from Soundcloud and use 4 gsubs to break it down. After becoming burdened with this, I added the Soundcloud API to obtain the track ID's a much simplier way.
```

Below is a list of my workflow:

January 13th, 2015

- Research Soundcloud API
- ER Diagram complete

![alt tag](https://raw.github.com/jamienf/mixit/master/app/assets/images/er_diagram.png)

January 14th, 2015

- Added badges for coverage
- Began writing Rspec and Capybara tests
- Added homepage, band page and ability to edit bands

January 15th, 2015

- Added ability to remove bands
