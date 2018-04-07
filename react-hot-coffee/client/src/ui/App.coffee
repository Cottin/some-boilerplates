React = require 'react'
{ hot } = require 'react-hot-loader'

_ = require './renderer'
Body = require './Body'


App = ->
	_ {s: 'w100 bglime'},
		_ Body

module.exports = hot(module)(App)
