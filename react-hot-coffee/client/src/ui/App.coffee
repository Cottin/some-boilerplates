React = require 'react'
{ hot } = require 'react-hot-loader'
{ Provider: FelaProvider } = require 'react-fela'

felaRenderer = require './felaRenderer'
Body = require './Body'


App = ->
	React.createElement FelaProvider, {renderer: felaRenderer},
		React.createElement Body

module.exports = hot(module)(App)
