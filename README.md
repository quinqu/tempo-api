# Tempo API

API for Tempo - a playlist curator based on running or walking speed. 
Hosted at tempo-app-api.herokuapp.com



* Ruby version
  * RAILS 6
  * Ruby 2.6.5

* System dependencies
  * [RSpotify](https://github.com/guilhermesad/rspotify) - A Ruby wrapper for the Spotify API 
  * [Concurrent](https://github.com/ruby-concurrency/concurrent-ruby) -  A mixin module that provides simple asynchronous behavior to a class



* Endpoints
  * GET tempo-app-api.herokuapp.com/auth/spotify 

  * GET tempo-app-api.herokuapp.com/playlist/(USERNAME)?metric=(UNIT)&speed=(SPEED)&height=(INCHES)
    * REQUIRED: Spotify username 
    * REQUIRED: Metric (codes: mph, kph, mpm)
    * REQUIRED: speed in the format of a double/float (as a string)
    * REQUIRED: height in inches


