React = require 'react'
Counter = require('./Counter').default

api = require '../api'

_ = require './renderer'

getName = ->
	res = await fetch('http://www.mocky.io/v2/5a9fa7df2e0000520074d138')
	json = await res.json()
	await sleep 1000
	return json

sleep = (ms) ->
	new Promise (res) -> setTimeout(res, ms)

Hello = ({name}) ->
	_ 'h1', {}, "Hello #{name}!!!"

class Body extends React.Component
	constructor: (props) ->
		super props
		@state = name: '...', countries: []

		getName().then ({hello}) => @setState {name: hello}

		api.country.get().then (countries) => @setState {countries}

	render: ->
		_ {},
			_ Hello, {name: @state.name}
			_ Counter
			_ 'br'
			_ 'br'
			_ 'br'
			_ 'br'
			@state.countries.map renderCountry


renderCountry = (country) ->
	_ {key: country}, country + '!!!!!'


module.exports = Body
