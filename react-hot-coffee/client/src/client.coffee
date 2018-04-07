React = require 'react'
{ render } = require 'react-dom'
{ hot } = require 'react-hot-loader'

root = document.createElement 'div'
document.body.appendChild root

_ = require './ui/renderer'
Body = require './ui/Body'

App = ->
	_ {s: 'w100 bglime'},
		_ Body
	
render(React.createElement(hot(module)(App), {}), root)
